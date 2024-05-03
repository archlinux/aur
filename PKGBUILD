# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSEE
_pkgver=2.16.0
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
md5sums=('098ec0eeda7e13bb6a60d1a28b0153f5')
b2sums=('7853caf5370e4acdc1ceaca168e17cb9b8ce12b10ea4d92ed2fa1b66037252419eba4537877daa1124f02bbe596716c89a2d92a922abf7ad6c46256c9cdcb81e')

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
