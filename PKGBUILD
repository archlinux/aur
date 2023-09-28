# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5gtk2
pkgver=1.0
pkgrel=1
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('any')
url="https://github.com/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d5c76b86baa7eba89db9ac7ab09b3407fb67879f14e7e1c63169e84fa048c337')

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
