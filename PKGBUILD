# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libtmcg
_pkgname=libTMCG
pkgver=1.3.17
pkgrel=1
pkgdesc="LibTMCG is a C++ library for creating secure and fair online card games."
arch=('x86_64')
url="http://www.nongnu.org/libtmcg/"
license=('GPL2')
depends=('libgcrypt>=1.7.0' 'gmp')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('26f9b63e471eedf62421a1e1d6bf6b7dc799279d81d1452fb77a2410e82c9212'
            'SKIP')
validpgpkeys=("76F73011329D27DB8D7C3F974F584EB8FB2BE14F")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

