# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libtmcg
_pkgname=libTMCG
pkgver=1.3.15
pkgrel=1
pkgdesc="LibTMCG is a C++ library for creating secure and fair online card games."
arch=('x86_64')
url="http://www.nongnu.org/libtmcg/"
license=('GPL2')
depends=('libgcrypt>=1.7.0' 'gmp')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('c6413fddbc08b64abd98a110241ff70de1bb9f1d35c570e24792332ce9cc707d'
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

