# Maintainer: GDucpm <gducpm@gmail.com>
pkgname=gmatrix
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast and lightweight terminal entertainment program for Matrix rain"
arch=('x86_64' 'aarch64')
url="https://github.com/gducpm/gmatrix"
license=('GPL3')
depends=('ncurses')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gducpm/gmatrix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b51f534ddf3e4cb19f7d646dd9e3f3e5f293d6f346cef9f86db2fa3dd9f1c940')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
