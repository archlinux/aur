# Maintainer: Luke
pkgname=lambda
pkgver=0.1.11
pkgrel=1
pkgdesc='Lambda calculus beta-reduction playground with ncurses and CLI front ends'
arch=('x86_64')
url='https://github.com/drmenguin/lambda'
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('572e305db49ad85038fabf35ff37a5636fcda1818c08f57c6aabda6c26190218')

build() {
  cd "$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
