# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BPRMeth
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Model higher-order methylation profiles'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biocstyle
  r-cowplot
  r-data.table
  r-doparallel
  r-e1071
  r-earth
  r-foreach
  r-genomicranges
  r-ggplot2
  r-iranges
  r-kernlab
  r-magrittr
  r-matrixcalc
  r-mvtnorm
  r-randomforest
  r-rcpp
  r-rcpparmadillo
  r-s4vectors
  r-truncnorm
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e785cfb968a5905fd9701c43839fe7e2bd1f58abd2003099aa856cc5482bfcb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
