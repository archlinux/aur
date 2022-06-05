# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AMARETTO
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('bd32789a54abfb240f4204976ce7dbfc15063713a964af278b20a4b452982d84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
