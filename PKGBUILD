# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=0.9
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('14c794ddd887a35fa15089ab77e3ba477b69e2f74f63b47be64db6f236fbde4e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
