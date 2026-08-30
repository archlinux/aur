# Maintainer: user14923929 <user14923929@users.noreply.github.com>
pkgname=espcanvas-renderer
pkgver=0.1.0
pkgrel=1
pkgdesc="OpenGL renderer for ESPCanvas remote-rendering firmware"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/espcanvas"
license=('GPL3')
depends=('qt6-base' 'qt6-serialport')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/espcanvas/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d24cc27545b7f3cafc401ccf534e9b9067378dd261eeb25c3a0a04a59d79ad7')

build() {
  cmake -B build -S "espcanvas-$pkgver/pc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
