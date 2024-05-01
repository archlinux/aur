# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AlpsNMR
_pkgver=4.6.0
pkgname=r-${_pkgname,,}
pkgver=4.6.0
pkgrel=1
pkgdesc='Automated spectraL Processing System for NMR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-baseline
  r-biocparallel
  r-cli
  r-dplyr
  r-fs
  r-future
  r-generics
  r-ggplot2
  r-glue
  r-htmltools
  r-magrittr
  r-matrixstats
  r-mixomics
  r-pcapp
  r-purrr
  r-readxl
  r-reshape2
  r-rlang
  r-rmarkdown
  r-scales
  r-signal
  r-speaq
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
)
optdepends=(
  r-biocstyle
  r-chemospec
  r-cowplot
  r-curl
  r-dt
  r-ggally
  r-ggrepel
  r-gridextra
  r-knitr
  r-plotly
  r-progressr
  r-s4vectors
  r-summarizedexperiment
  r-testthat
  r-writexl
  r-zip
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d341015fe03fed2c7fce2dcf3cb7a1cb7d95eaa2b37223961cf134112b71eb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
