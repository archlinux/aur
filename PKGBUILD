# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSEE
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive SummarizedExperiment Explorer"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-circlize
  r-colourpicker
  r-complexheatmap
  r-dt
  r-ggplot2
  r-ggrepel
  r-igraph
  r-listviewer
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
  r-genomicranges
  r-hdf5array
  r-htmltools
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-scater
  r-scrapper
  r-scrnaseq
  r-tenxpbmcdata
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51f2a218d8c11427efd2973c7d3bc9e1')
b2sums=('184b8d6f968508eea1c22805b2f24f82715b40a95bd4ed5d4491e9d2ef78dd9ea4d5cf9a8bbfac0b2b6a0d3f6d5a8f763871aa735512297cd767742b773bfa8f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
