# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

pkgname=qt5gtk2
pkgver=0.3
pkgrel=2
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('i686' 'x86_64')
url="https://bitbucket.org/trialuser02/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('de2095f9fe31cb0142601fba8ee5af23a659ca7463514c95f21b012c79f4bfa9')

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
