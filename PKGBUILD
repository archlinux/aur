# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpatialCPie
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Cluster analysis of Spatial Transcriptomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-colorspace
  r-data.table
  r-digest
  r-dplyr
  r-ggforce
  r-ggiraph
  r-ggplot2
  r-ggrepel
  r-igraph
  r-lpsolve
  r-purrr
  r-readr
  r-rlang
  r-shiny
  r-shinycssloaders
  r-shinyjs
  r-shinywidgets
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-zeallot
)
optdepends=(
  r-biocstyle
  r-jpeg
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08da94287f89fb8041fed4f1b4c33819ad40ef3b93287c468483e3a08ca9465e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
