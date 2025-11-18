pkgname=image-analyze
pkgver=2.2.2
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('x86_64')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('9890ea183640808dba30384050009ebc842e42e9754ce7999a4f64a7b0abaf4d')
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
