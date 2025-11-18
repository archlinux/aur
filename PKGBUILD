pkgname=image-analyze
pkgver=2.2.1
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('x86_64')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('3e76f3d66ce5c1205c1431dfb70af4b37b7c689947f780b1fc9dc5a40e05e88a')
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
