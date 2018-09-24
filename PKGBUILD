# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-stdx-allocator
pkgver=2.77.3
pkgrel=1
pkgdesc="Extracted std.experimental.allocator for usage via DUB"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd meson)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/stdx-allocator/archive/v$pkgver.tar.gz")
sha256sums=('cf558f19bffe555c4f022ab2090b9ad46086eb1dfe7be02cd9fa7451d1b857a6')

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../stdx-allocator-$pkgver --prefix=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
