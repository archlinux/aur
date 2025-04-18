# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ngsReports
_pkgver=2.10.0
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
md5sums=('f35d97b1f156d63f54709796fcd5c19a')
b2sums=('0afd94bdd04b888730b2086ec90266ca32bf2902d441aff2e0a301a45cd90fd6479496dda83192c1e95da34fb0141f7203073476891a79db455310ce6e0d4d5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
