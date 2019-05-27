# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.26
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc')
depends=('python' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import'
            'sccs: alternative backend')
source=("https://gitlab.com/esr/src/-/archive/$pkgver/src-$pkgver.tar.gz")
sha512sums=('df87b47ea98871a52e76dbb711df8d9695fbacec5ac5f84b0d0fa56e8fc71d4fe4a0940696e8eb2914709d8165bfc8773b1986b90df43b98c9832e8768e7ea37')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
