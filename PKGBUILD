# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=POMA
_pkgver=1.14.0
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
  r-fsa
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-impute
  r-janitor
  r-limma
  r-lme4
  r-magrittr
  r-mixomics
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
md5sums=('2319e020f51efe618ec87124847cfbc4')
b2sums=('992e5eafcebcc30a9d52249b86008f28b47d01925a1ffd396cbc204f12a34006f29c4e1139af44fdc7bd924a7853bd84528df4e24d58c76af03a8df47cfa4437')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
