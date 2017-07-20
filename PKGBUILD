# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5gtk2
pkgver=0.4
pkgrel=3
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('i686' 'x86_64')
url="https://bitbucket.org/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4743de9559606bacd6f3d8835aac769b13c3d76d8698a05c95888430c4f0fbbd')

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
