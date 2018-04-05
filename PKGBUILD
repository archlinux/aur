# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-stdx-allocator
pkgver=2.77.1.1
pkgrel=1
pkgdesc="Extracted std.experimental.allocator for usage via DUB"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd meson)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/stdx-allocator/archive/v$pkgver.tar.gz")
sha256sums=('9d9b897e67b9d7c2eea9144f8f4e50eb2f8d49e30d587416c1750403a84a6f91')

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
