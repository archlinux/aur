# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>

# XXX: The following warning cannot be removed because CMAKE stores the build
# directory in the executable 'iqtree'.

# ==> WARNING: Package contains reference to $srcdir
# usr/bin/iqtree

pkgname=iqtree-latest
pkgver=1.7
pkgrel=2
pkgdesc="Efficient phylogenomic software by maximum likelihood; multicore version (OMP)"
arch=(x86_64)
url="http://www.iqtree.org/"
license=('GPL2')
depends=('cmake' 'eigen' 'glibc' 'libstdc++5' 'zlib')
# TODO: Remove beta2 string when possible.
source=("https://github.com/Cibiv/IQ-TREE/archive/v${pkgver}-beta2.tar.gz")
md5sums=('78f27d31d7a6a7f300793bed13237649')

build() {
  # TODO: Remove beta2 string when possible.
  cd IQ-TREE-${pkgver}-beta2
  mkdir -p build
  cd build
  cmake -DIQTREE_FLAGS=omp ..
  make
}

package() {
  # TODO: Remove beta2 string when possible.
  cd IQ-TREE-${pkgver}-beta2
  install -D -m 755 build/iqtree ${pkgdir}/usr/bin/iqtree
}
