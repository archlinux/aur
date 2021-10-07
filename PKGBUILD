# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=PHOTOS
pkgname=photos
pkgver=3.64
pkgrel=1
pkgdesc="C++ Interface to PHOTOS"
arch=("x86_64")
url="http://photospp.web.cern.ch/photospp"
license=('unknown')
depends=(gcc-fortran hepmc pythia8 tauola++)
source=("http://photospp.web.cern.ch/photospp/resources/${_pkgname}.$pkgver/${_pkgname}.$pkgver.tar.gz")
sha256sums=('92c545d83c0f654ca40949c7e36e79a96230421659a4621cd9ae9c82dd5a30ee')

build() {
  cd "${_pkgname}"
  ./configure \
      --prefix=/usr \
      --without-hepmc \
      --with-hepmc3=/usr \
      --with-pythia8=/usr \
      --with-tauola=/usr

  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir/usr" install
}
