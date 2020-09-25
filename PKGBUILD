# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rom-properties
pkgver=1.7.2
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
sha256sums=('d727a18d91fbf925c47e1049cffa74a4003221ce69720ce938c0ea92270b70b9')

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
