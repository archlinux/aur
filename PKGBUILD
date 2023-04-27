# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytomapper
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Visualization of highly multiplexed imaging data in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-delayedarray
  r-ebimage
  r-ggbeeswarm
  r-ggplot2
  r-hdf5array
  r-matrixstats
  r-nnls
  r-raster
  r-rcolorbrewer
  r-rhdf5
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
  r-svglite
  r-svgpanzoom
  r-viridis
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-knitr
  r-markdown
  r-rmarkdown
  r-shinytest
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('accae57d6e5e0120341f48f57854688d8f203d5f1ec06948e1dacf4bb86171fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
