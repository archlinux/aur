# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.34
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7e8e5b22fa3dfe2b12fefcd8826dd9a031997073786f97a84492fb40b250fd4e')

build() {
  cd "$pkgname-$pkgver"

  make "$pkgname"{,.1} cvssync.1
  2to3 -w cvssync cvsconvert
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
