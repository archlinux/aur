# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=json-table
pkgdesc='Transform nested JSON data into tabular data in the shell'
pkgver=4.3.3
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/micha/json-table'
license=('EPL')
depends=()
makedepends=()
source=(https://github.com/micha/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('0ab7bb2a705ad3399132060b30b32903762473ff79b5a6e6f52f086e507b0911')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    echo "${pkgdir}/usr"
    PREFIX="${pkgdir}/usr" make
    PREFIX="${pkgdir}/usr" make test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m755 jt "${pkgdir}/usr/bin/jt"
    install -D -m644 jt.1 "${pkgdir}/usr/share/man/jt.1"
}
