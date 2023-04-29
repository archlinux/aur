# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TCGAbiolinksGUI
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=4
pkgdesc='"TCGAbiolinksGUI: A Graphical User Interface to analyze cancer molecular and clinical data"'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-clusterprofiler
  r-colourpicker
  r-data.table
  r-downloader
  r-dt
  r-elmer
  r-ggplot2
  r-ggrepel
  r-maftools
  r-pathview
  r-plotly
  r-readr
  r-sesame
  r-shiny
  r-shinybs
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-stringr
  r-summarizedexperiment
  r-tcgabiolinks
  r-tcgabiolinksgui.data
)
optdepends=(
  r-animation
  r-biocstyle
  r-devtools
  r-dplyr
  r-knitr
  r-pander
  r-rmarkdown
  r-roxygen2
  r-rvest
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd61457b41b884759d93f1fc619c215a843c69b52cf83270d8f433c6be3ee598')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
