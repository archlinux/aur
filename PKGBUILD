# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=src
pkgver=1.25
pkgrel=1
pkgdesc="Simple Revision Control with modern UI for single-file projects"
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import'
            'sccs: alternative backend')
source=("https://gitlab.com/esr/src/-/archive/$pkgver/src-$pkgver.tar.gz")
sha512sums=('327c4a063777b934fedf84f3228bae2268ceedf99aa0e682d69e8b45755580b5db77b84283fddbfd6084e137823faa9a445d842f9e30cc33e280965463aeba78')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
