# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=magnum-integration
pkgver=2016.05.13
pkgrel=1
pkgdesc='Integration libraries for Magnum graphics engine'
arch=('x86_64' 'i686')
url='http://mosra.cz/blog/magnum.php'
license=('MIT')
depends=('magnum' 'bullet')
makedepends=('cmake' 'git' 'ninja')
source=('git://github.com/mosra/magnum-integration.git#commit=bd36a8ce1cc2')
sha1sums=('SKIP')

build() {
  mkdir -p build
  cd build

  cmake ../magnum-integration \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_BULLET=ON \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
