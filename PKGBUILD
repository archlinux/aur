# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plotGrouper
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Shiny app GUI wrapper for ggplot with built-in statistical analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-colourpicker
  r-dplyr
  r-egg
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-gtable
  r-hmisc
  r-magrittr
  r-readr
  r-readxl
  r-rlang
  r-scales
  r-shiny
  r-shinythemes
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-htmltools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5a952b0cc8e861cf1afe74eaca1ef2f6e3aa1c565b5e773e483256cfd066975')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
