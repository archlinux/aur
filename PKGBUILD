# Maintainer: Amish <contact at via dot aur>
# Contributor: Aaron Bishop < erroneous at gmail >

pkgname=qdecoder
pkgver=12.1.0
pkgrel=1
pkgdesc="A simple and powerful CGI library for C/C++ programming language."
arch=('x86_64')
url="https://wolkykim.github.io/qdecoder/"
license=('custom')
depends=()
source=("https://github.com/wolkykim/qdecoder/archive/v${pkgver}.tar.gz")
sha256sums=('edd32bd5119d276afa9e01cd54a1c23049cad4e96dc6a8e48ac324580e085ebb')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
