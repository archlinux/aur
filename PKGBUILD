# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=zig
pkgver=0.0.1
pkgrel=1
pkgdesc='System programming language intended to replace C'
arch=('x86_64' 'i686')
url='http://ziglang.org/'
license=('MIT')
depends=('llvm' 'clang')
makedepends=('cmake')
source=("git://github.com/andrewrk/zig.git#commit=ed50bd1")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
