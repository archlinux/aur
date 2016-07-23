# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=PHOTOS
pkgname=photos
pkgver=3.61
pkgrel=1
pkgdesc="C++ Interface to PHOTOS"
arch=("i686" "x86_64")
url="http://photospp.web.cern.ch/photospp"
license=('unknown')
makedepends=(pythia tauola++)
depends=(gcc-fortran hepmc)
source=("http://photospp.web.cern.ch/photospp/resources/${_pkgname}.$pkgver/${_pkgname}.$pkgver.tar.gz")
sha256sums=('8f9ae59d40e6ec077f5de69b21324745ff3a73e71f3ea22a539782029e0445f4')

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr --with-hepmc=/usr --with-pythia8=/usr --with-tauola=/usr
  make
}

package() {
  cd "${_pkgname}"
  make PREFIX="$pkgdir/usr" install
}
