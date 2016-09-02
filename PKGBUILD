# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=zig
pkgver=0.0.0
pkgrel=1
pkgdesc='System programming language intended to replace C'
arch=('x86_64' 'i686')
url='http://ziglang.org/'
license=('MIT')
depends=('llvm' 'clang')
makedepends=('cmake')
source=("git://github.com/andrewrk/zig.git#commit=f18e34c")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
