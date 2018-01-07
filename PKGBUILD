# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=fasttree
pkgver=2.1.10
pkgrel=1
pkgdesc="Approximately-Maximum-Likelihood Trees for Large Alignments"
arch=(i686 x86_64)
url="http://www.microbesonline.org/fasttree/"
license=('GPL')
source=(http://www.microbesonline.org/fasttree/FastTree-${pkgver}.c)
sha256sums=('54cb89fc1728a974a59eae7a7ee6309cdd3cddda9a4c55b700a71219fc6e926d')

build() {
  cd "$srcdir/"
  gcc -DOPENMP -fopenmp -DUSE_DOUBLE -Wall -O3 -finline-functions -funroll-loops -o FastTree -lm FastTree-${pkgver}.c
}

package() {
  install -Dm 755 $srcdir/FastTree $pkgdir/usr/bin/FastTree
}

# vim:set ts=2 sw=2 et:
