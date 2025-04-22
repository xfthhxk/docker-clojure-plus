FROM clojure:temurin-21-tools-deps-jammy

## libgomp1 is needed for datalevin else you'll get an UnsatisfiedLinkError
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils apt-transport-https ca-certificates gnupg curl sudo libgomp1 -o APT::Immediate-Configure=0

RUN sudo mkdir -p /etc/apt/keyrings

## -- Install Babashka, binary is bb --
RUN curl -s https://raw.githubusercontent.com/borkdude/babashka/master/install | bash

RUN  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*