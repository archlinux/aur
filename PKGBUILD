# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=gr-fosphor-git
pkgver=3fdfe7c
pkgrel=1
pkgdesc="GNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL acceleration"
arch=('any')
url="http://sdr.osmocom.org/trac/wiki/fosphor"
license=(unknown)
depends=('gnuradio' 'boost' 'swig' 'glfw' 'opencl-headers')
makedepends=('cmake')
provides=('gr-fosphor')
source=('git://git.osmocom.org/gr-fosphor')
sha1sums=('SKIP')
_gitname=gr-fosphor

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
