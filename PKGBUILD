# Maintainer: GDucpm <gducpm@gmail.com>
pkgname=gmatrix
pkgver=2.0.0
pkgrel=1
pkgdesc="A fast and lightweight terminal entertainment program for Matrix rain"
arch=('x86_64' 'aarch64')
url="https://github.com/gducpm/gmatrix"
license=('GPL3')
depends=('ncurses')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gducpm/gmatrix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f0a868d3e37dfc6bb476205e605df46af8c541445af6edb73a6a244a9a7449c')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
