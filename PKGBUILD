# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSEE
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Interactive SummarizedExperiment Explorer'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-circlize
  r-colourpicker
  r-complexheatmap
  r-dt
  r-ggplot2
  r-ggrepel
  r-igraph
  r-rintrojs
  r-s4vectors
  r-shiny
  r-shinyace
  r-shinydashboard
  r-shinyjs
  r-shinywidgets
  r-singlecellexperiment
  r-summarizedexperiment
  r-vipor
  r-viridislite
)
optdepends=(
  r-biocstyle
  r-covr
  r-delayedarray
  r-hdf5array
  r-htmltools
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-scater
  r-scrnaseq
  r-tenxpbmcdata
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44b2ecfea6f47e414b372c04e68be5384e873336c7caffb6b07a206905d71e4e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
