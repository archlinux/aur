# Maintainer: artist for Sonic-DE

pkgname=sonic-frameworks-keybind
pkgver=6.26.0
pkgrel=1
pkgdesc='sonic-frameworks-keybind allows to have global accelerators that are independent of the focused window'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-keybind'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-tools)
conflicts=(kglobalaccel)
provides=(kglobalaccel)
replaces=(kglobalaccel)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('4c38636274cf99a068fc240082ecb0158b3b31545616267e85fefee1fc8e2f52')
