pkgname=image-analyze
pkgver=2.3.0
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('x86_64')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('19afbc27dd963461ed8d5c62466678a739342e4409324a0d03d0327ba0aa46b0')
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
