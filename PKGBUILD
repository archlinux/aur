# Maintainer: Luke
pkgname=lambda
pkgver=0.1.9
pkgrel=1
pkgdesc='Lambda calculus beta-reduction playground with ncurses and CLI front ends'
arch=('x86_64')
url='https://github.com/drmenguin/lambda'
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f6cec40932f30b1708942291bf486f16627f7501ac75de30e372c76fb9d3cdc')

build() {
  cd "$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
