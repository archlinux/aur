# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libtmcg
_pkgname=libTMCG
pkgver=1.3.16
pkgrel=1
pkgdesc="LibTMCG is a C++ library for creating secure and fair online card games."
arch=('x86_64')
url="http://www.nongnu.org/libtmcg/"
license=('GPL2')
depends=('libgcrypt>=1.7.0' 'gmp')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('fe4c065524ecc5faf2b0d9b47f4b1488a102360ea71a6b35aae145d2b0a5529d'
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

