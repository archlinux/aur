# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeOmics
_pkgver=1.20.0
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
md5sums=('99a1885166873f8eab0a78a35d0efbdc')
b2sums=('e1b3dd1e7361f48878912e14712978a5b2647982106f858a9fdc8dcff512f9829ba5188e6d040a4f4cb20729cfb50ec79fc86599c821907919f98de32806f8c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
