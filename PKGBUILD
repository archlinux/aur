# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.29
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
b2sums=('3ba27ca2873bf09947770c8bcb8ce4b807f3cded24195988cf73074a725fbcb881636e7a31bef560f2440b6c8951e68cd08c2400f2675e6936310d9063b08019')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
