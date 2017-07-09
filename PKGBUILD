# Maintainer:  <gucong@gc-desktop>
pkgname=mgridgen
pkgver=1.0
pkgrel=1
pkgdesc="Library for obtaining a sequence of successive coarse grids for geometric multigrid methods"
arch=('i686' 'x86_64')
url="http://www-users.cs.umn.edu/~moulitsa/software.html"
license=('unknown')
depends=()
source=(http://www-users.cs.umn.edu/~moulitsa/download/ParMGridGen-$pkgver.tar.gz
        ParMGridGen-$pkgver.patch)
md5sums=('2872fa95b7fb91d6bd525490eed62038'
         'fded6059aea5158740d31568c9474b2d')

prepare() {
  cd "$srcdir/ParMGridGen-$pkgver"

  patch -p1 -i "$srcdir/ParMGridGen-$pkgver.patch"
}

build() {
  cd "$srcdir/ParMGridGen-$pkgver"

  make make=make serial
}

package() {
  cd "$srcdir/ParMGridGen-$pkgver"

  install -Dm644 mgridgen.h "$pkgdir/usr/include/mgridgen.h"
  install -Dm755 libmgrid.so "$pkgdir/usr/lib/libmgrid.so"
  install -Dm755 mgridgen "$pkgdir/usr/bin/mgridgen"

}

# vim:set ts=2 sw=2 et:
