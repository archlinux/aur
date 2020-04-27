# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5gtk2
pkgver=0.7
pkgrel=1
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('i686' 'x86_64')
url="https://bitbucket.org/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8e8be7d8ab5d816eeb62b662b1a795f467d91cfe6ff623965acd1cbfc1b51fe7')

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
