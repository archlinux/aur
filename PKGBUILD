# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5gtk2
pkgver=0.6
pkgrel=1
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('i686' 'x86_64')
url="https://bitbucket.org/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4bcd65737296749ad9d900df43f0b82d2e4d309ef6485c2dee5b061a132f83b9')

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
