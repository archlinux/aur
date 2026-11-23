# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msqrob2
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Robust statistical inference for quantitative LC-MS proteomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-assertthat
  r-biocparallel
  r-dplyr
  r-ggplot2
  r-limma
  r-lme4
  r-matrixstats
  r-multiassayexperiment
  r-purrr
  r-qfeatures
  r-rlang
  r-summarizedexperiment
)
optdepends=(
  r-arrow
  r-biocstyle
  r-complexheatmap
  r-covr
  r-data.table
  r-exploremodelmatrix
  r-ggcorrplot
  r-gridextra
  r-iq
  r-kableextra
  r-knitr
  r-mscoreutils
  r-msdatahub
  r-msnbase
  r-multcomp
  r-plotly
  r-refmanager
  r-rmarkdown
  r-scater
  r-sessioninfo
  r-stringr
  r-testthat
  r-tidyr
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('49164d8a9a31323778aa8482fd5631bb23f0b6d3cf4ee1c423874ddb5131461b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
