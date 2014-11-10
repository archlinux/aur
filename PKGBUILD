# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=rcs-fast-import
pkgver=1.0
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2' 'rcs')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('57bb2771ecc534f71e479af0cbcb4a9b4b75d106b3fe7259191ead8c261f0604')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '1s/python/python2/' rcs-fast-import
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  install "$pkgname" "$pkgdir/usr/bin"
  install -m644 "$pkgname.1" "$pkgdir/usr/share/man/man1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
