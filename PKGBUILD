# system requirements: To generate html reports pandoc(http://pandoc.org/installing.html) is required.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiscoRhythm
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Interactive Workflow for Discovering Rhythmicity in Biological Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocstyle
  r-broom
  r-data.table
  r-dplyr
  r-dt
  r-ggextra
  r-ggplot2
  r-gridextra
  r-heatmaply
  r-kableextra
  r-knitr
  r-magick
  r-matrixstats
  r-matrixtests
  r-metacycle
  r-plotly
  r-reshape2
  r-rmarkdown
  r-s4vectors
  r-shiny
  r-shinybs
  r-shinycssloaders
  r-shinydashboard
  r-shinyjs
  r-summarizedexperiment
  r-upsetr
  r-venndiagram
  r-viridis
  r-zip
  pandoc
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb2a9967cde8ccb29777600347bbc763ea15e0b184fc613db7bd4eca4a28a3d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
