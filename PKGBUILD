# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beachmat
_pkgver=2.18.1
pkgname=r-${_pkgname,,}
pkgver=2.18.1
pkgrel=1
pkgdesc='Compiling Bioconductor to Handle Each Matrix Type'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-biocgenerics
  r-delayedarray
  r-rcpp
  r-sparsearray
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-hdf5array
  r-knitr
  r-rcmdcheck
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54cc8e943c607012c9760814b0305b8ad75a083f54a4d6c2dc3063358795e8cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
