# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AMARETTO
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='Regulatory Network Inference and Driver Gene Evaluation using Integrative Multi-Omics Analysis and Penalized Regression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-biocfilecache
  r-callr
  r-circlize
  r-complexheatmap
  r-curatedtcgadata
  r-doparallel
  r-dplyr
  r-dt
  r-foreach
  r-ggplot2
  r-glmnet
  r-gridextra
  r-httr
  r-impute
  r-knitr
  r-limma
  r-matrixstats
  r-multiassayexperiment
  r-rcpp
  r-readr
  r-reshape2
  r-rmarkdown
  r-tibble
)
optdepends=(
  r-knitr
  r-mass
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b644791f05a1bb48fe61f86c0042d7efbf3a6da76abe5e76e2df13389c2e86a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
