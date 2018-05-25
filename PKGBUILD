# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=simpleconvert
pkgver=3.0
pkgrel=1
pkgdesc='Application to convert multiple files to another filetype using FFMPEG.'
url='https://github.com/bartkessels/simpleconvert'
arch=('x86_64')
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4992e234a88a9a74547685d89396b19061472c52b4edc5e8ff395cb1ac4778a0')

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
