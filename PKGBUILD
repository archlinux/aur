pkgname=image-analyze
pkgver=1.1.1
pkgrel=1
pkgdesc="Lightweight image viewer that supports measuring distance in pixels"
arch=('x86_64')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('ace1966c5cf0aca8899fd814ea105c1c1770463278d5f71122c4401a60d33f41')
licence='MIT'
depends=('sfml')
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