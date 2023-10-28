# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PathoStat
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='PathoStat Statistical Microbiome Analysis Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biocstyle
  r-complexheatmap
  r-corpcor
  r-deseq2
  r-devtools
  r-dplyr
  r-dt
  r-edger
  r-ggplot2
  r-glmnet
  r-gmodels
  r-knitr
  r-limma
  r-matrixstats
  r-phyloseq
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-rentrez
  r-reshape2
  r-rocr
  r-scales
  r-shiny
  r-shinyjs
  r-tidyr
  r-vegan
  r-webshot
  r-xml
)
optdepends=(
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3abfbf299ed4b268a47d199bd1f5e33ec7b53aca0652fbaab39a0ed66238599')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
