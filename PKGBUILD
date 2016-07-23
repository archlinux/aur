# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=TAUOLA
pkgname=tauola++
pkgver=1.1.6b
pkgrel=1
pkgdesc="C++ Interface to Tauola"
arch=("i686" "x86_64")
url="http://tauolapp.web.cern.ch/tauolapp"
license=('GPL3')
depends=(gcc-fortran hepmc lhapdf pythia)
source=("http://tauolapp.web.cern.ch/tauolapp/resources/${_pkgname}.$pkgver/${_pkgname}.$pkgver-LHC.tar.gz")
sha256sums=('1c84b7eb3bbd9645c751ae0d2ab998d15732a5da1fe5a28750677d3c6fe5f0e3')

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr --with-hepmc=/usr --with-lhapdf=/usr --with-pythia8=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
