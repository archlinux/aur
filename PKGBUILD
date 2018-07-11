# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=simpleconvert
pkgver=3.2
pkgrel=1
pkgdesc='Application to convert multiple files to another filetype using FFMPEG.'
url='https://github.com/bartkessels/simpleconvert'
arch=('x86_64')
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'qt5-base')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1b39acabdb26810e8fc4550247b5fe92bb6b25871e1b9993bb1352384abcae96')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr SimpleConvert.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname}-${pkgver}" INSTALL_ROOT="${pkgdir}" install
}
