# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.24
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import'
            'sccs: alternative backend')
source=("$url$pkgname-$pkgver.tar.gz")
sha512sums=('46eded47b65b7e6722ca5d6b327cd58fc9048f1738a127748ef115a0f51d9fa3c48b3b27cc642791f46643a8594561bebda233916bf9e8eaf21b5c07228d4e46')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
