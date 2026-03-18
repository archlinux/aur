pkgname=bro
pkgver=1.16.63
pkgrel=1
pkgdesc="Git made bro-ish"
arch=('x86_64')
url="https://github.com/grepTHEGOD/bro"
license=('MIT')
depends=('zlib' 'json-c' 'ncurses' 'libcurl')
makedepends=('cmake' 'make')

source=("$pkgname-$pkgver.tar.gz::https://github.com/grepTHEGOD/bro/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -Dm755 build/bro "$pkgdir/usr/bin/bro"
    install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

