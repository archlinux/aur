# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=combblas
pkgver=1.4.0
pkgrel=1
url="http://gauss.cs.ucsb.edu/~aydin/CombBLAS/html/"
pkgdesc="Combinatorial BLAS Library"
makedepends=('cmake')
depends=('openmpi')
arch=('i686' 'x86_64')
license=("BSD")
source=("http://gauss.cs.ucsb.edu/~aydin/CombBLAS_FILES/CombBLAS_beta_14_0.tgz")
md5sums=('57aed213d7e794153ea29465559e7cfa')

build() {
  cd "${srcdir}/CombBLAS"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON ..
  make
}

package() {
  cd "${srcdir}/CombBLAS/build"
  install -d "$pkgdir"/usr/include/combblas
  cp ../*.h "$pkgdir"/usr/include/combblas
  install -d "$pkgdir"/usr/lib
  cp *.so "$pkgdir"/usr/lib
}

