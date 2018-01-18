# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=biobambam
pkgver=2.0.83
pkgrel=1
_release=20180105121132
pkgdesc="BAM file pre-processing utilities for bioinformatics."
arch=('x86_64')
url="https://github.com/gt1/biobambam2"
license=('GPL3')
makedepends=('libmaus')
source=("${pkgname}"-"${pkgver}"-"${_release}".tar.gz::https://github.com/gt1/"${pkgname}"2/archive/"${pkgver}"-release-"${_release}".tar.gz)
sha256sums=('28c751b899d5f2a4414ea0f36b43b91c129aea83447b93a0920875401c29ec35')
MAKEFLAGS="-j$(nproc)"

build() {
  cd "${srcdir}"/"${pkgname}2"-"${pkgver}"-release-"${_release}"
  ./configure --prefix="${pkgdir}"/usr
}

check() {
  cd "${srcdir}"/"${pkgname}2"-"${pkgver}"-release-"${_release}"
  make test
}

package() {
  cd "${srcdir}"/"${pkgname}2"-"${pkgver}"-release-"${_release}"
  make install
}
