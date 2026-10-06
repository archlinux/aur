# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-ui
pkgver=6.30.0
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
sha256sums=('8a2e32e492ef5a3212c26a3b8526bcc2891be889f4cb6c7ade6a324ff9d257f7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
