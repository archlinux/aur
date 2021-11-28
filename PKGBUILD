# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=ttos
pkgver=1.0.0
pkgrel=1
arch=("x86_64")
url="https://github.com/shyaminayesh/ttos"
pkgdesc="Tunnel TO Socket"
makedepends=("go")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("b9226bf866e7e89e62ce1c84ccbf8e00ca3d0bfa24f6e1bf6ff49e62555c1e74")

build() {
    cd "${pkgname}-${pkgver}"
    go build ./ttos.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
