# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=pebble
pkgver=2.0.1
pkgrel=1
arch=("x86_64")
url="https://github.com/avanciro/pebble"
pkgdesc="Simple cli utility to manage database schema"
makedepends=("go")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("1a024b81405cc811d1ee225254bcce479c6c722637e80f2a51091da70b9836b8")

build() {
    cd "${pkgname}-${pkgver}"
    go build ./pebble.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}