
pkgname=openvolumemesh
pkgver=2.0.0
pkgrel=1
pkgdesc="flexible geometry modeling and processing system"
arch=('i686' 'x86_64')
url="http://www.openvolumemesh.org"
license=('LGPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("git+https://www.graphics.rwth-aachen.de:9000/OpenVolumeMesh/OpenVolumeMesh.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/OpenVolumeMesh"
  mkdir -p build && pushd build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
  make
}

package() {
  cd "${srcdir}"/OpenVolumeMesh/build
  make DESTDIR="${pkgdir}" install
}
