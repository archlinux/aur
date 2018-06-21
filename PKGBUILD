# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=biobambam
pkgver=2.0.87
pkgrel=1
_release=20180301132713
pkgdesc="BAM file pre-processing utilities for bioinformatics."
arch=('x86_64')
url="https://github.com/gt1/biobambam2"
license=('GPL3')
makedepends=('libmaus')
source=("${pkgname}"-"${pkgver}"-"${_release}".tar.gz::https://github.com/gt1/"${pkgname}"2/archive/"${pkgver}"-release-"${_release}".tar.gz)
sha256sums=('a90500e547465d8d0455bda7936e0b660c0fd3f1b243083ec0739527f802dcf4')

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
