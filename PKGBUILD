# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=webtunnel-client-git
pkgver=a2f9d5a6
pkgrel=1
pkgdesc="Pluggable Transport based on HTTP Upgrade(HTTPT) - Server"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel"
license=('GPL3')
makedepends=('go' 'gcc' 'git')
options=('!emptydirs' '!strip')

# Source to compile to a specific commit
source=("git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel.git#commit=a2f9d5a60ee8b2b743f87885fd47917315d10b70")

sha256sums=('SKIP')

build(){
    export PATH=$PATH:$(go env GOPATH)/bin/
    cd ${srcdir}/webtunnel/main/client
    go build
}

package() {
    install -D -m755 "${srcdir}"/webtunnel/main/client/client -T "${pkgdir}"/usr/local/bin/webtunnel-client
}
