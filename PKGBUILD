# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-keybind
pkgver=6.29.0
pkgrel=1
pkgdesc='Add support for global workspace shortcuts'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-keybind'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         qt6-base)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kglobalaccel)
conflicts=(kglobalaccel)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7ba0f0f6be33aed23bc31d281ff044258b659535e763dea4dea9a1e77340ee65')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
