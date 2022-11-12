# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=POMA
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='User-friendly Workflow for Metabolomics and Proteomics Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-caret
  r-complexheatmap
  r-dbscan
  r-deseq2
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-glasso
  r-glmnet
  r-impute
  r-limma
  r-magrittr
  r-mixomics
  r-randomforest
  r-rankprod
  r-rmarkdown
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-uwot
  r-vegan
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggraph
  r-knitr
  r-patchwork
  r-plotly
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa46b19eec19f9fac89864fdd56848bdc63e323443fb5d8582ba7aea930e8652')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
