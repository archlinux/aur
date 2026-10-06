# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-open-collab
pkgver=6.30.0
pkgrel=1
arch=(x86_64)
pkgdesc='Qt library that implements the Open Collaboration Services API'
url='https://github.com/Sonic-DE/sonic-frameworks-open-collab'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         qt6-base)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(attica)
conflicts=(attica)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c1df999d64e83ccce277d1c75ce8376a0dd668b98b9815d9470bf114e88ae206')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
