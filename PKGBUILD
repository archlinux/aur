# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libtmcg
_pkgname=libTMCG
pkgver=1.3.14
pkgrel=1
pkgdesc="LibTMCG is a C++ library for creating secure and fair online card games."
arch=('x86_64')
url="http://www.nongnu.org/libtmcg/"
license=('GPL2')
depends=('libgcrypt>=1.7.0' 'gmp')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('141cd2d2b20c9b3f4eb0087b65f9ba888d6720b239b529ce9e87a1a46b77611b'
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

