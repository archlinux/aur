# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-color-scheme
pkgver=6.30.0
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-color-scheme'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         kconfig
         ki18n
         libstdc++
         qt6-base
         sonic-frameworks-gui-addons)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kcolorscheme)
conflicts=(kcolorscheme)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('50ed2d41f62912cd6de1bdfd2aa400f743e178819d87966b10796b5c22346dfc')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
