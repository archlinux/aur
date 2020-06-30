# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=miga
pkgver=0.7.2
pkgrel=1
arch=("x86_64")
makedepends=("go")
pkgdesc="Golang CLI database migration tool"
url="https://github.com/chapsuk/miga"
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("27f786158090eb4e7df590bbdaa74b3345d219bb089e6b5cfe8ca5a32507376a")


build() {
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
