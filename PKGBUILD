pkgname=image-analyze
pkgver=2.3.1
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('any')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('3e915ef5ff600b0184f15e4e528cc9dc276ce3e7364357a0c927236d14ae3de5')
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
