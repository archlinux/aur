# Maintainer:	markzz <mark dot weiman at markzz dot com>
# Contributor:  fxbru <frxbru|at|gmail|dot|com>
# Contributor:	TDY <tdy|at|gmx|dot|com>
# Contributor:	Andrea Scarpino <bash.lnx|at|gmail|dot|com>

pkgname=pcalc
pkgver=4
pkgrel=1
pkgdesc="A command-line programmer's calculator handling HEX/DEC/OCT/BIN"
arch=('i686' 'x86_64')
url="http://pcalc.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz)
sha512sums=('6492ca89c5f60549f9388d8b7edad21c1c912feea0ee1a1271d730a63832c3b562b1a6bc9f69a0bd3118407906646c8d8fbed6c6d9a62db6a6bbde22579c1fd0')

build() {
  cd "$srcdir"
  bsdtar -xf $pkgname-$pkgver.tar.xz || return 1
  make -C $pkgname-$pkgver || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 EXAMPLE "$pkgdir/usr/share/doc/$pkgname/EXAMPLES"
}
