# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=pebble
pkgver=2.0.2
pkgrel=1
arch=("x86_64")
url="https://github.com/avanciro/pebble"
pkgdesc="Simple cli utility to manage database schema"
makedepends=("go")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("b9226bf866e7e89e62ce1c84ccbf8e00ca3d0bfa24f6e1bf6ff49e62555c1e74")

build() {
    cd "${pkgname}-${pkgver}"
    go build ./pebble.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}