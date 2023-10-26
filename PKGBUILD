# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppcseq
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Probabilistic Outlier Identification for RNA Sequencing Generalized Linear Models'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-benchmarkme
  r-bh
  r-dplyr
  r-edger
  r-foreach
  r-furrr
  r-future
  r-ggplot2
  r-lifecycle
  r-magrittr
  r-purrr
  r-rcpp
  r-rcppeigen
  r-rlang
  r-rstan
  r-rstantools
  r-stanheaders
  r-tibble
  r-tidybayes
  r-tidyr
  make
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b60e366828d56b33735e5b37aad4a643b8b69e65c35202d6ac319c39f53ae605')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
