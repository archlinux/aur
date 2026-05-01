# Maintainer: blobii <realblobii@proton.me>

pkgname=wandoo
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple and sturdy tree-based todo software in pure C using ncurses."
arch=('x86_64')
url="https://github.com/realblobii/wandoo"
license=('GPL')
depends=('ncurses')
makedepends=('gcc' 'cmake')

source=("$pkgname-$pkgver.tar.gz::https://github.com/realblobii/wandoo/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
