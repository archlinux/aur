# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=rom-properties
pkgver=2.1
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL2')
depends=('curl' 'zlib' 'libpng' 'libjpeg-turbo' 'nettle' 'tinyxml2' 'libseccomp')
optdepends=('zstd' 'lz4' 'lzo')
makedepends=('cmake' 'pkgconf' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v${pkgver}.tar.gz")
sha256sums=('0322ade297b0b04196741da8b87e9b12d06ab58dbca8f0fef5fc3da1754f7904')

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
