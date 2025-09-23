# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ngsReports
_pkgver=2.10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Load FastqQC reports and other NGS related files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biocgenerics
  r-biostrings
  r-checkmate
  r-dplyr
  r-forcats
  r-ggdendro
  r-ggplot2
  r-jsonlite
  r-lifecycle
  r-lubridate
  r-patchwork
  r-plotly
  r-reshape2
  r-rlang
  r-rmarkdown
  r-scales
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-zoo
)
optdepends=(
  r-biocstyle
  r-cairo
  r-dt
  r-knitr
  r-pander
  r-readr
  r-testthat
  r-truncnorm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00bc4a5a682da20983e2e35f33dd20d7')
b2sums=('7e8c3db12d29c580177e9f6f28b00cf81b69697108886162097536cdec822c2377ddf01618d2f5b4a3590031f6ec5178fe202903967d1904d4e5a311454f0c73')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
