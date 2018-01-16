# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libtmcg
_pkgname=libTMCG
pkgver=1.3.10
pkgrel=1
pkgdesc="LibTMCG is a C++ library for creating secure and fair online card games."
arch=('x86_64')
url="http://www.nongnu.org/libtmcg/"
license=('GPL2+')
depends=('libgcrypt' 'gmp')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('3f6d3adb7d07145033a278dbeb8fcaea43207de4ba79ab4c324b5a4bf82150b8'
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

