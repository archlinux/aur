# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-idle-tracker
pkgver=6.29.0
pkgrel=1
pkgdesc='X11 user activity monitoring framework for SonicDE'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-idle-tracker'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         libstdc++
         libx11
         libxcb
         libxext
         libxss
         qt6-base)
makedepends=(doxygen
             sonic-frameworks-cmake-modules
             qt6-tools)
provides=(kidletime)
conflicts=(kidletime)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dfc49ab447bca0043fcca711eb40c0e9b870ac286344b370d30107bd40121df5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
