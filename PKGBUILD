# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigPint
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=1
pkgdesc='Big multivariate data plotted interactively'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-delayedarray
  r-dplyr
  r-ggally
  r-ggplot2
  r-gridextra
  r-hexbin
  r-hmisc
  r-htmlwidgets
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-reshape
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-stringr
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocgenerics
  r-data.table
  r-edaseq
  r-edger
  r-gtools
  r-knitr
  r-matrixstats
  r-rmarkdown
  r-roxygen2
  r-runit
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a76b38968b8ca2087b7c831040a97b82438c239b350f5948b0968955cc92fe5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
