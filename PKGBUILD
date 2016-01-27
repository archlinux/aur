# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.1
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('29fc3cd040d92ca9524208403b89639ea6e0687a7952fe24d52ccdc6cf78d7b0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
