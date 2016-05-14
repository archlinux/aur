# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=corrade
pkgver=2016.05.13
pkgrel=1
pkgdesc='Utility library for C++11/C++14'
arch=('x86_64' 'i686')
url='http://mosra.cz/blog/corrade.php'
license=('MIT')
makedepends=('cmake' 'git' 'ninja')
depends=('gcc-libs')
source=('git://github.com/mosra/corrade.git#commit=142b2a7241')
sha1sums=('SKIP')

build() {
  mkdir -p build
  cd build

  cmake "../$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
