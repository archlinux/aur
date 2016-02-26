pkgname=libmesh
pkgrel=1
pkgver=0.9.5
pkgdesc="A C++ Finite Element Library"
arch=("i686" "x86_64")
url="http://libmesh.github.io/"
license=('LGPL')
depends=('eigen' 'hdf5' 'boost-libs' 'intel-tbb' 'vtk' 'glpk' 'netcdf' 'nlopt')
makedepends=('bison')
source=("https://github.com/libMesh/libmesh/releases/download/v${pkgver}/libmesh-${pkgver}.tar.bz2")
sha1sums=('f05e7de1a01c5f62ca662300ba1a1e042f710b66')

build() {
  cd "${srcdir}/libmesh-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libmesh-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
