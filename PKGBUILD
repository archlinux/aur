# system requirements: GNU make
# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=h5mread
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="A fast HDF5 reader"
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  r-sparsearray
)
makedepends=(
  make
  r-rhdf5lib
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-experimenthub
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-tenxbraindata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b39adb72729ff85b4d673c39e4de28e9')
b2sums=('720741f4bb0968ff5d2a4197f8161ae3ced98321b12589022ed6fc291574e024736008ff3cfd9288cead0b54edaf360fe52ad5fd69897791e9bb072e4d75cbb4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
