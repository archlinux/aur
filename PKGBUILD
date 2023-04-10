# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beachmat
_pkgver=2.14.2
pkgname=r-${_pkgname,,}
pkgver=2.14.2
pkgrel=1
pkgdesc='Compiling Bioconductor to Handle Each Matrix Type'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-rcpp
  gcc
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
sha256sums=('c4c2f827b1a18ead552f0fd30d7c29eed308473c5f0ccf025534dbae8e10edd4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
