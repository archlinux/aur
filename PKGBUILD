# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSEE
_pkgver=2.20.0
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
md5sums=('7ff850817446b8be5649a31dfb720c92')
b2sums=('9879984e1cfb4f8d049c09957875ea002b7694fa0a9b7f306ea2e9796c3268c899fab90417bcdf26da3239e92f3a7eb4eecce2b7c750acba8244747f961748e6')

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
