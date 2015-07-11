# Maintainer:  Brian Bidulock <bidulock@openss7.org>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=karmen
pkgver=0.15
pkgrel=2
pkgdesc="An easy-to-use window manager for X"
arch=('i686' 'x86_64')
url="http://karmen.sourceforge.net/"
license=('MIT')
depends=('libx11')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8f800b71b454d6f0de2e9dd5ad34f9e3')

build() {
  cd $pkgname-$pkgver
  sed -i 's/LICENSE //' Makefile.in
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
