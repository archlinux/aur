# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=hnb
pkgver=1.9.17
pkgrel=5
pkgdesc="Ncurses based hierarchical notebook to structure many kinds of data in one place."
arch=('i686' 'x86_64')
url="http://hnb.sourceforge.net"
license=("GPL3")
depends=('ncurses')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c73b5f63d8ffe1976c915c1f8265951d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D src/hnb $pkgdir/usr/bin/hnb
  install -D -m444 doc/hnb.1 $pkgdir/usr/share/man/man1/hnb.1
}
