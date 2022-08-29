pkgname=mpi-bucky
pkgver=1.4.4
pkgrel=2
pkgdesc="Bayesian Untangling of Concordance Knots https://doi.org/10.1093/bioinformatics/btq539"
arch=('x86_64')
conflicts=('bucky')
url="https://github.com/tkchafin/mpi-bucky"
license=('GPL')
depends=('gcc-libs' 'boost-libs' 'openmpi')
makedepends=('clang' 'boost' 'openmpi' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
for bin in bucky mbsum
do
  install -Dm 755 $bin $pkgdir/usr/bin/$bin
done
}
