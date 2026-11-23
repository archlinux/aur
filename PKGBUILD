# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=POMA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Omics Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-broom
  r-caret
  r-complexheatmap
  r-dbscan
  r-deseq2
  r-dplyr
  r-fgsea
  r-fsa
  r-ggcorrplot
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-impute
  r-janitor
  r-limma
  r-lme4
  r-magrittr
  r-mixomics
  r-msigdbr
  r-multcomp
  r-purrr
  r-randomforest
  r-rankprod
  r-rlang
  r-summarizedexperiment
  r-sva
  r-tibble
  r-tidyr
  r-uwot
  r-vegan
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggraph
  r-ggtext
  r-knitr
  r-patchwork
  r-plotly
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f19ee12429469ff7e069a22a5c19a3d7')
b2sums=('ca6a1f783a870ce44593386459e022b472813b155f044aeacb569225199970688f5044fc0e0157ed005e2dbfc51062f7cfac7ea0b854baffd7d97aae8de7021b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
