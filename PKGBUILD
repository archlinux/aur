# Maintainer: GDucpm <gducpm@gmail.com>
pkgname=gmatrix
pkgver=2.0.1
pkgrel=1
pkgdesc="A fast and lightweight terminal entertainment program for Matrix rain"
arch=('x86_64' 'aarch64')
url="https://github.com/gducpm/gmatrix"
license=('GPL3')
depends=('ncurses')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gducpm/gmatrix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f41a971c356013edf60efbed04861f07f1a45f5c479f76b044423c2134709332')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
