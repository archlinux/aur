# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rom-properties
pkgver=1.6.1
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL2')
depends=('gtk2'
         'gtk3'
         'libjpeg-turbo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v${pkgver}.tar.gz")
sha256sums=('66202c59dbe5bc4e36e18a6629530156f86ded9aeed57d224a5476b112a21ebc')

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