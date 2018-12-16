# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5gtk2
pkgver=0.5
pkgrel=1
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('i686' 'x86_64')
url="https://bitbucket.org/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3edb98eeb95889f48eb5f55c7e8ff1a6263b58460be3b09da81c411c5d5e43f8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
              QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
