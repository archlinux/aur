pkgname=image-analyze
pkgver=2.1.0
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('x86_64')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('6f560a10111ebe7071e437159188d7a69923f2a2a188574e49c0afe64e3e110f')
licence='GPL2'
depends=()
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
