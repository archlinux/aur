# Maintainer: artist for Sonic-DE

pkgname=sonic-frameworks-keybind
pkgver=6.24.0
pkgrel=2
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
conflicts=('kglobalaccel')
provides=('kglobalaccel')
replaces=('kglobalaccel')
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('d5a5ab9bd0b88c0892661632b92b49a2f3908d5d31232a7ba222c9a7408d5739')

