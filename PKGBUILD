# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=animalcules
_pkgver=1.18.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive microbiome analysis toolkit"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ape
  r-assertthat
  r-caret
  r-covr
  r-deseq2
  r-dplyr
  r-dt
  r-forcats
  r-ggplot2
  r-gunifrac
  r-limma
  r-magrittr
  r-multiassayexperiment
  r-plotly
  r-rentrez
  r-reshape2
  r-rocit
  r-s4vectors
  r-scales
  r-shiny
  r-shinyjs
  r-summarizedexperiment
  r-tibble
  r-tsne
  r-umap
  r-vegan
  r-xml
)
optdepends=(
  r-biocstyle
  r-biomformat
  r-devtools
  r-glmnet
  r-knitr
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eb0d7e45ea49758bec2b9f248328b1eb')
b2sums=('b25df402dfa315ff24c7d6f03a3288e30da7f21fdaf68da6b543ff440a5caf19346bcbad60b9e6c7c60bdb1284c0e170525653576904fc36c69293d142559d16')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
