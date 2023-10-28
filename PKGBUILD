# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ToxicoGx
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=1
pkgdesc='Analysis of Large-Scale Toxico-Genomic Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-catools
  r-coregx
  r-data.table
  r-downloader
  r-dplyr
  r-ggplot2
  r-jsonlite
  r-limma
  r-magrittr
  r-reshape2
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-markdown
  r-pharmacogx
  r-rmarkdown
  r-testthat
  r-tinytex
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b88afaaa37cd354ed2901604c7e6105fd14324f1c0beda61d8a8d2a0a0708f33')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
