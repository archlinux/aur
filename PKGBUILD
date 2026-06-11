# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-ui
pkgver=6.26.0
pkgrel=2
pkgdesc='A QtQuick based components set'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-quick-ui'
license=(LGPL-2.0-only
         LGPL-3.0-only)
depends=(glibc
         libgomp
         libstdc++
         qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(doxygen
             qt6-shadertools
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kirigami)
conflicts=(kirigami)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6026b9bcc9a09541602b481fdb8d23bdb26a12448ab7b79d66297f89b98f2c7c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

