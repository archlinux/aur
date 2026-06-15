# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-keybind
pkgver=6.27.0
pkgrel=1
pkgdesc='Add support for global workspace shortcuts'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-keybind'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(libstdc++
         glibc
         qt6-base)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kglobalaccel)
conflicts=(kglobalaccel)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d1edb69cee5ca8b6ca5177348f3e66c35da7f59f9bbbc8d1ee21a2d083e6680f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
