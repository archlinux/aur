# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=libnexus
pkgver=4.4.3
pkgrel=1
pkgdesc="libnexus provides functionality for loading/saving the nexus file format for scientific data"
url="http://www.nexusformat.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('hdf5-cpp-fortran')
optdepends=('hdf4: hdf4 file format support')
source=("$pkgname::git://github.com/nexusformat/code.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_CXX=ON \
    "${srcdir}/libnexus"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
