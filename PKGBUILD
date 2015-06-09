# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=aop
pkgver=0.6
pkgrel=1
pkgdesc="Ambassador of Pain, a curses-based arcade game in only 64 lines of C code"
arch=('i686' 'x86_64')
url="http://raffi.at/view/code/aop"
license=('GPL2')
depends=('ncurses')
source=("http://raffi.at/code/aop/$pkgname-$pkgver.tar.gz" "$pkgname.patch")
md5sums=('8057b3ec240db608253d653eb692d244'
         '6c1428c601897a244e2e693f5a235762')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/aop.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,share/$pkgname}
  install -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -m644 $pkgname-level-*.txt $pkgdir/usr/share/$pkgname
}
