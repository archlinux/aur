# Maintainer: user14923929 <user14923929@users.noreply.github.com>
pkgname=espcanvas-renderer
pkgver=0.1.1
pkgrel=1
pkgdesc="OpenGL renderer for ESPCanvas remote-rendering firmware"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/espcanvas"
license=('GPL3')
depends=('qt6-base' 'qt6-serialport')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/espcanvas/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3f8cdea3dd3a8d8e4d80e37e45f6a246ec9fb1cb4b316f68e273f1e19d2cf51')

build() {
  cmake -B build -S "espcanvas-$pkgver/pc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
