# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=rom-properties
pkgver=1.9
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL2')
depends=('curl' 'zlib' 'libpng' 'libjpeg-turbo' 'nettle' 'tinyxml2' 'libseccomp' 'openmp')
makedepends=('cmake' 'pkgconf' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v${pkgver}.tar.gz")
sha256sums=('50a38d85eb37d27ceebcbf412db53f2506281650deda476be0a42126463f7784')

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
