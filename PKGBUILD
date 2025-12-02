# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeOmics
_pkgver=1.22.0
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
md5sums=('3199a96560cb1501a16ac36a456c0574')
b2sums=('7a90bce0961a5d3711f5bf9d84e357917523de3513bbf0d713b01774fea3ea2122420cc86e81eb978f27b3cafa6510fd3a0a5e98a7e1fe216525be49f26e332c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
