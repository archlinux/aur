pkgname=image-analyze
pkgver=3.0.0
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('any')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('b6c06d8947b692e617e6a50e6c3acbf537f8436d49ec14ae5d1fa66d2fce1e09')
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
