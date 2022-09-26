# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5gtk2
pkgver=0.8
pkgrel=1
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('any')
url="https://bitbucket.org/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('90157247862b7239b9a062f3b27d67fcb79210a7557abb9099db22d98c0f34aa')

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
