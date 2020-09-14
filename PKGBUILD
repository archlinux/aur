# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=pebble
pkgver=2.0.0
pkgrel=1
arch=("x86_64")
url="https://github.com/avanciro/pebble"
pkgdesc="Simple cli utility to manage database schema"
makedepends=("go")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("f2023e58994733244218f2cbf71230aa3cd79e35254f9953da48b97fa69dc72c")

build() {
    cd "${pkgname}-${pkgver}"
    go build ./pebble.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}