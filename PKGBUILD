# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeOmics
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Time-Course Multi-Omics data integration"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-checkmate
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-lmtest
  r-magrittr
  r-mixomics
  r-plyr
  r-purrr
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-gplots
  r-igraph
  r-knitr
  r-rmarkdown
  r-snow
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('051c5b8a48e338b1dfe161fe9ced080a')
b2sums=('35b6955aa6183ef0247d5eb3c1183c723cc0f50e41434ebb088a040bb6ee6c2611bd737eaacda2b75f548cada415462b982157064b274a52bebc4063025b99bf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
