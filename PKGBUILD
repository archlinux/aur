# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=libmaus
pkgver=2.0.442
pkgrel=1
_release=20180115152528
pkgdesc="Bioinformatics data structures and algorithms in C++"
arch=('x86_64')
url="https://github.com/gt1/libmaus2"
license=('GPL3')
source=(https://github.com/gt1/"${pkgname}"2/archive/"${pkgver}"-release-"${_release}".tar.gz)
sha256sums=('17efe43b3a8ab2b6f560931b2936f5d5f1cf59541406cfc02eaac359238593e8')
MAKEFLAGS="-j$(nproc)"

build() {
  cd "${srcdir}"/libmaus2-"${pkgver}"-release-"${_release}"
  ./configure --prefix="${pkgdir}"/usr/local --exec-prefix "${pkgdir}"/
  make
}

check() {
  cd "${srcdir}/libmaus2-${pkgver}-release-${_release}"
  make test
}

package() {
  cd "${srcdir}"/libmaus2-"${pkgver}"-release-"${_release}"
  make install
  mv "${pkgdir}"/lib "${pkgdir}"/usr/lib
}
