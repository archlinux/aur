# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.28
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
b2sums=('9d40cd7c765ebeb127d20a82d048d2484e61766ed5ed326470ff238b0969ba1389f8a05c37a1fa39097041f8cc56de77a7ed1e2b3cd68fb2a41d4a7e1b12c129')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
