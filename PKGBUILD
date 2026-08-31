# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-workspace-wallpapers
pkgver=6.7.4.1
pkgrel=2
pkgdesc='Additional wallpapers for the Sonic Workspace'
arch=(any)
url='https://github.com/Sonic-DE/sonic-workspace-wallpapers'
license=(LGPL)
makedepends=(qt5-base sonic-frameworks-cmake-modules)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5ef63972b620f5d1cfb96cfe41e5830e4c0def0e285b966889ca7a61b0d14859')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
