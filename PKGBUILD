# Maintainer: Luke
pkgname=lambda
pkgver=0.1.1
pkgrel=1
pkgdesc='Lambda calculus beta-reduction playground with ncurses and CLI front ends'
arch=('x86_64')
url='https://github.com/drmenguin/lambda'
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('323045f7610643a6bf37031e12c53d78b7db7466db517bfd86cbbaba1447ddc9')

build() {
  cd "$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
