# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rom-properties
pkgver=1.7.1
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL2')
depends=('gtk2'
         'gtk3'
         'libjpeg-turbo')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v${pkgver}.tar.gz")
sha256sums=('04cf8667cf8b7d3a203254f25c8a1a6a7ab9a408f41f7c897ff99eb4b3f73f20')

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
