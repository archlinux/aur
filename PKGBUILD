# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.7
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import'
            'sccs: alternative backend')
source=("$url$pkgname-$pkgver.tar.gz")
sha256sums=('fabb2123ceee2e6ee041208ab77056a3e400704722db640d576e986d72b26de3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
