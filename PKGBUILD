# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=simpleconvert
pkgver=3.1
pkgrel=1
pkgdesc='Application to convert multiple files to another filetype using FFMPEG.'
url='https://github.com/bartkessels/simpleconvert'
arch=('x86_64')
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('acf3f6ef13eb9a0b2c7c9a112b1fb72d8e9a51a58ed10fabe4b148b11ac8bb2e')

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
