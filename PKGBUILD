# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ngsReports
_pkgver=2.6.1
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
md5sums=('e6826263770483383516a6f7e1e241b1')
b2sums=('be1cc68d09ea31dc22794e4d20bb17d887cb82de55432a3454d2f69106f147c196ba2617acfc5584f405c7d0dec97e6db6003a3959ae1d0c97fa60149ac21ef7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
