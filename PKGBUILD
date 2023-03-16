# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 01/05/2022

pkgname=qt6-location-dev
pkgver=6.4.3
pkgrel=1
pkgdesc="QtLocation, built from dev branch, until it is officialy released."
arch=("x86_64")
url="https://github.com/qt/qtlocation"
license=("MIT")
depends=(qt6-base qt6-positioning qt6-shadertools)
makedepends=(git cmake)

source=("git+https://github.com/emericg/qtlocation.git#branch=dev_643")
sha256sums=('SKIP')

build() {
  cmake -B build -S qtlocation -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
