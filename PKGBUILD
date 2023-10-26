# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsLiP
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='LiP Significance Analysis in shotgun mass spectrometry-based proteomic experiments'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-checkmate
  r-data.table
  r-dplyr
  r-factoextra
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-msstats
  r-msstatsconvert
  r-msstatsptm
  r-purrr
  r-rcpp
  r-scales
  r-stringr
  r-tibble
  r-tidyr
  r-tidyverse
)
optdepends=(
  r-biocstyle
  r-covr
  r-gghighlight
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('98c6c819e10aa945d87695a38a360cb600101e0904b330f9c3eb37ac4aed2f20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
