# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>

# XXX: The following warning cannot be removed because CMAKE stores the build
# directory in the executable 'iqtree'.

# ==> WARNING: Package contains reference to $srcdir
# usr/bin/iqtree

pkgname=iqtree
pkgver=2.1.2
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood; multicore version (OMP)"
arch=(x86_64)
url="http://www.iqtree.org/"
license=('GPL2')
depends=('cmake' 'boost' 'eigen' 'glibc' 'libstdc++5' 'zlib')
source=("https://github.com/iqtree/iqtree2/archive/v${pkgver}.tar.gz")
md5sums=('83e85d78b096b48607b7dbf91f8211a9')

build() {
  cd iqtree2-${pkgver}
  mkdir -p build
  cd build
  cmake -DIQTREE_FLAGS=omp ..
  make
}

package() {
  cd iqtree2-${pkgver}
  install -D -m 755 build/iqtree2 ${pkgdir}/usr/bin/iqtree2
}
