# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-ui
pkgver=6.29.0.2
pkgrel=1
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
sha256sums=('cc4ada196bc0aab34490f6a0006dd7ecf4aa90977a91251fcae5e0d88b1b6af9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
