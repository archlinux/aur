pkgname=image-analyze
pkgver=3.0.1
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('any')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('98467c130d9efe5bebf5ee0b12195f61fe39b3dd012f31df1b6fb96c567d4339')
licence='GPL2'
depends=('glfw' 'libspng' 'libjpeg-turbo')
makedepends=('base-devel' 'cmake' 'pkgconf')
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
