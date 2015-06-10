# Maintainer:	markzz <mark dot weiman at markzz dot com>
# Contributor:  fxbru <frxbru|at|gmail|dot|com>
# Contributor:	TDY <tdy|at|gmx|dot|com>
# Contributor:	Andrea Scarpino <bash.lnx|at|gmail|dot|com>

pkgname=pcalc
pkgver=3
pkgrel=1
pkgdesc="A command-line programmer's calculator handling HEX/DEC/OCT/BIN"
arch=('i686' 'x86_64')
url="http://pcalc.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz)
sha512sums=('55b6644300a8eb5224df5a0885907c10847df7ab6296d012eb2bb638876687ddbe23d5b76e31ac6ff4c159e44940d5cf6ba747f2a410943fdc25c9d9855fd60e')

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
