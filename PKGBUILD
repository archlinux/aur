# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeOmics
_pkgver=1.16.0
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
md5sums=('ba8315de54ba6b48d8f3a6bb1c3c1487')
b2sums=('b8165d9cff2db57b77cf7c333c116cb5967484dac8e54e1aff133450fd18dbb3c37850d18f4334f5c48457fc76f1b503588a3f5d8fd2ef57cfc6db07c51ec0f7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
