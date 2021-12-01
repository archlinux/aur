# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=simpleconvert
_pkgname=SimpleConvert
pkgver=3.2
pkgrel=2
pkgdesc='Application to convert multiple files to another filetype using FFMPEG.'
url='https://github.com/bartkessels/SimpleConvert'
arch=('x86_64')
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'qt5-base')
makedepends=('qt5-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ba8dee967a1d0f0874f3e7663d7f2cd300b02853b806d5a4b43c47ccb4429eeb')

build() {
  cd "${_pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr ${_pkgname}.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${_pkgname}-${pkgver}" INSTALL_ROOT="${pkgdir}" install
}
