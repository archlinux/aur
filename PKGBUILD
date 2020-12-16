# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=simgrid
pkgver=3.26
pkgrel=1
pkgdesc='A scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems.'
arch=('i686' 'x86_64')
url='https://simgrid.org/'
license=('LGPL')
source=('https://framagit.org/simgrid/simgrid/-/archive/v3.26/simgrid-v3.26.tar.gz')
depends=('boost' 'python')
makedepends=('cmake')
md5sums=('def636e0d80ddc61b0d1832673a21c52')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Denable_compile_optimizations=ON \
    -Denable_documentation=OFF \
    -Denable_lto=ON \
    -Denable_smpi=ON
  make -j $(nproc)
  make DESTDIR="${pkgdir}" install
}
