# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=fasttree
pkgver=2.1.11
pkgrel=1
pkgdesc="Approximately-Maximum-Likelihood Trees for Large Alignments"
arch=(i686 x86_64)
url="http://www.microbesonline.org/fasttree/"
license=('GPL')
source=(http://www.microbesonline.org/fasttree/FastTree-${pkgver}.c)
sha256sums=('9026ae550307374be92913d3098f8d44187d30bea07902b9dcbfb123eaa2050f')

build() {
  cd "$srcdir/"
  gcc -DOPENMP -fopenmp -DUSE_DOUBLE -Wall -O3 -finline-functions -funroll-loops -o FastTree -lm FastTree-${pkgver}.c
}

package() {
  install -Dm 755 $srcdir/FastTree $pkgdir/usr/bin/FastTree
}

# vim:set ts=2 sw=2 et:
