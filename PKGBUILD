pkgname=image-analyze
pkgver=2.2.0
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('x86_64')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('2d728d3267043230b41139b927af82c193cb9b1eb1303e9d8c06da43593174b2')
licence='GPL2'
depends=('glfw')
makedepends=('cmake' 'make' 'gcc')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build" --parallel
}
package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
