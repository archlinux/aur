# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ngsReports
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='Load FastqQC reports and other NGS related files'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-checkmate
  r-dplyr
  r-dt
  r-forcats
  r-ggdendro
  r-ggplot2
  r-jsonlite
  r-lifecycle
  r-lubridate
  r-pander
  r-patchwork
  r-plotly
  r-readr
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
  r-knitr
  r-testthat
  r-truncnorm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('abc115a8dd01244ce57952cfbee1d09b675d40c8141d53c4fc33b4adb1a9145e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
