# Maintainer: artist for Sonic-DE

pkgname=sonic-frameworks-keybind
pkgver=6.25.0
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
conflicts=('kglobalaccel')
provides=('kglobalaccel')
replaces=('kglobalaccel')
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

sha256sums=('6ccc6202b77e53bcefdb0ccad3f40e44921cd6cdc44ecd1b9156d34d906a31c3')
