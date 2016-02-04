# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.3
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('f7a44e7820a55a7efdaa8a9ab7938f054c340fbbd91bba30ec1339d4fe2bdf03')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
