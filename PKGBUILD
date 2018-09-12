# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
pkgname=iqtree-latest
pkgver=1.7
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood; multicore version (OMP)"
arch=(x86_64)
url="http://www.iqtree.org/"
license=('GPL2')
depends=('cmake' 'eigen' 'glibc' 'libstdc++5' 'zlib')
# TODO: Remove beta string when possible.
source=("https://github.com/Cibiv/IQ-TREE/archive/v${pkgver}-beta.tar.gz")
md5sums=('1973cacc62ac9b0dd12f7262ebf8e8b9')

build() {
  # TODO: Remove beta string when possible.
  cd IQ-TREE-${pkgver}-beta
  mkdir -p build
  cd build
  cmake -DIQTREE_FLAGS=omp ..
  make
}


package() {
  # TODO: Remove beta string when possible.
  cd IQ-TREE-${pkgver}-beta
  install -D -m 755 build/iqtree ${pkgdir}/usr/bin/iqtree
}
