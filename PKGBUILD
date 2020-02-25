# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=simgrid
pkgver=3.25
pkgrel=4
pkgdesc='A scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems.'
arch=('i686' 'x86_64')
url='https://simgrid.org/'
license=('LGPL')
source=('https://framagit.org/simgrid/simgrid/-/archive/v3.25/simgrid-v3.25.tar.gz')
depends=('boost')
makedepends=('cmake')
md5sums=('b1e32d5511604fb17cc919fd1de379ea')

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
