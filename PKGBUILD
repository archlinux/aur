# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=sccs2rcs
pkgver=1.9
pkgrel=1
pkgdesc="Move an SCCS repository to RCS"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('cssc' 'python2' 'rcs')
source=($url$pkgname-$pkgver.tar.gz)
sha256sums=('29734657f123375e2e15bae0743ba41bc2a40c9f0736768782b4e6440f56bb25')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -ie 1s/python/python2/ sccs2rcs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  install -m755 sccs2rcs "$pkgdir/usr/bin"
  install -m644 sccs2rcs.1 "$pkgdir/usr/share/man/man1"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
