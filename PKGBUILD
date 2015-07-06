# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=fasttree
pkgver=2.1.8
pkgrel=1
pkgdesc="Approximately-Maximum-Likelihood Trees for Large Alignments"
arch=(i686 x86_64)
url="http://www.microbesonline.org/fasttree/"
license=('GPL')
source=(http://www.microbesonline.org/fasttree/FastTree.c)
md5sums=('c7e85689a26cabba241378d4f633c2fa')

build() {
  cd "$srcdir/"
  gcc -DOPENMP -fopenmp -DUSE_DOUBLE -Wall -O3 -finline-functions -funroll-loops -o FastTree -lm FastTree.c
}

package() {
  install -Dm 755 $srcdir/FastTree $pkgdir/usr/bin/FastTree
}

# vim:set ts=2 sw=2 et:
