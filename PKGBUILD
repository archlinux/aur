# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ngsReports
_pkgver=2.14.0
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
md5sums=('cbf747a7ced73aa388a56656b67cb782')
b2sums=('1baa7b42f0d30d7a67c4bd6965f1f0153493f6a92c41cd758fe59061496bdf79cb24d726e5108d24fbf4771a4f82eab53e2d0682448f0cae19ce03b60025e4de')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
