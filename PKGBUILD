pkgname=wscat
pkgver=1.0.1
pkgrel=2
pkgdesc="Netcat-like utility for WebSockets"
url="https://github.com/websockets/wscat"
arch=("x86_64" "i686")
license="custom"
makedepends=("npm")

pkgver() {
    npm show wscat | awk -F"[: ',]+" '/version:/ { print $3 }'
}

build() {
    echo ""
}

package() {
    export npm_config_prefix="${pkgdir}/usr"
    npm install -g wscat
}
