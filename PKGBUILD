# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AlpsNMR
_pkgver=4.0.2
pkgname=r-${_pkgname,,}
pkgver=4.0.2
pkgrel=1
pkgdesc='Automated spectraL Processing System for NMR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-baseline
  r-biocparallel
  r-dplyr
  r-fs
  r-furrr
  r-future
  r-ggally
  r-ggplot2
  r-ggrepel
  r-glue
  r-htmltools
  r-magrittr
  r-matrixstats
  r-mixomics
  r-pcapp
  r-plyr
  r-purrr
  r-readxl
  r-reshape2
  r-rlang
  r-rmarkdown
  r-s4vectors
  r-signal
  r-speaq
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
  r-writexl
  r-zip
)
optdepends=(
  r-chemospec
  r-dt
  r-knitr
  r-plotly
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f41e5f7db7f55cdf91ad2781274965dfd4e959e5f2734cb42d9b3a440dc398f8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
