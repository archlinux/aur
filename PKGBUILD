# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSEE
_pkgver=2.18.0
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
  r-scrnaseq
  r-tenxpbmcdata
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('610054ed8c9baa845d8ac58576cad743')
b2sums=('45e6dd94cc6d7305442d117d4f02253a6dfe7a03a798d877285a5b9744ed4a980cd9210f3644f0623a81e36179e7b908fa3ccfb59b35987cc7f08587ffd95a32')

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
