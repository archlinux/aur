# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeOmics
_pkgver=1.24.0
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
md5sums=('8ac9d6d5db4adf7372c378e46b4c7946')
b2sums=('1e8b969ba8c3025e17d9d42d37bb134416371459cc5171151aa4133fac06040bf87a1e2ab73fcbb7a12273f8f721adb942f7eb5f5bc045b6e9b016e98c8fadcc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
