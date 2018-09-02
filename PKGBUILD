# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-stdx-allocator
pkgver=2.77.2
pkgrel=3
pkgdesc="Extracted std.experimental.allocator for usage via DUB"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd meson)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/stdx-allocator/archive/v$pkgver.tar.gz")
sha256sums=('b0f9e7b885b8500929fffd95306259eb03af8b05cce72c414d1036cc69da7005')

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
