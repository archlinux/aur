# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=rcs-fast-import
pkgver=0.3
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2' 'rcs')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('5d013d344b8ba3cc43030b90ed2cb6a89efc1a05c226f7b5d988c53408087490')

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
