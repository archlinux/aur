# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=magnum-examples
pkgver=2016.05.13
pkgrel=1
pkgdesc='Examples for the Magnum OpenGL graphics engine'
arch=('x86_64' 'i686')
url='http://mosra.cz/blog/magnum.php'
license=('MIT')
depends=('magnum' 'magnum-plugins' 'magnum-integration' 'bullet' 'openal')
makedepends=('cmake' 'git' 'ninja')
source=('git://github.com/mosra/magnum-examples.git#commit=84e799d52cd5')
sha1sums=('SKIP')

build() {
  mkdir -p build
  cd build

  cmake ../magnum-examples \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_AUDIO_EXAMPLE=ON \
    -DWITH_BULLET_EXAMPLE=ON \
    -DWITH_CUBEMAP_EXAMPLE=ON \
    -DWITH_MOTIONBLUR_EXAMPLE=ON \
    -DWITH_PRIMITIVES_EXAMPLE=ON \
    -DWITH_PICKING_EXAMPLE=ON \
    -DWITH_TEXT_EXAMPLE=ON \
    -DWITH_TEXTUREDTRIANGLE_EXAMPLE=ON \
    -DWITH_TRIANGLE_EXAMPLE=ON \
    -DWITH_VIEWER_EXAMPLE=ON \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
