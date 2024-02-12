# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigPint
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Big multivariate data plotted interactively"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-delayedarray
  r-dplyr
  r-ggally
  r-ggplot2
  r-gridextra
  r-hexbin
  r-hmisc
  r-htmlwidgets
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-reshape
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-stringr
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocgenerics
  r-data.table
  r-edaseq
  r-edger
  r-gtools
  r-knitr
  r-matrixstats
  r-rmarkdown
  r-roxygen2
  r-runit
  r-tibble
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7f90f98dd155967a4c4afb250886d8f')
b2sums=('4a3f0decd77da639eaef749619f1b0f84c8145f4394d39fa4098679d819e6844ae59198112926ae51c4020fb179110916aa054d9ab3adee59f7f93d9d24966f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
