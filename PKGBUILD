# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=simgrid
pkgver=3.34
pkgrel=1
pkgdesc='A scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems.'
arch=('i686' 'x86_64')
url='https://simgrid.org/'
license=('LGPL')
source=('https://framagit.org/simgrid/simgrid/-/archive/v3.34/simgrid-v3.34.tar.gz')
depends=('boost' 'python' 'eigen')
makedepends=('cmake')
md5sums=('7dee08f0d959ea64fd6597aff64721e9')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Denable_compile_optimizations=ON \
    -Denable_lto=ON \
    -Denable_smpi=ON \
    -Denable_documentation=OFF \
    -Denable_python=OFF
  make -j $(nproc)
  make DESTDIR="${pkgdir}" install
}
