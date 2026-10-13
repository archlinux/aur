# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=2.6.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Set Variation Analysis for Microarray and RNA-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-cli
  r-delayedarray
  r-delayedmatrixstats
  r-gseabase
  r-hdf5array
  r-iranges
  r-matrixgenerics
  r-memuse
  r-s4arrays
  r-s4vectors
  r-singlecellexperiment
  r-sparsearray
  r-sparsematrixstats
  r-spatialexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-bluster
  r-data.table
  r-edger
  r-experimenthub
  r-future
  r-genefilter
  r-ggplot2
  r-ggspavis
  r-gsvadata
  r-igraph
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-patchwork
  r-plotly
  r-promises
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-scrapper
  r-shiny
  r-shinybusy
  r-shinydashboard
  r-shinyjs
  r-spatiallibd
  r-sva
  r-tenxpbmcdata
  r-tenxvisiumdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26906288ae8c30ee5b78cd4164309f06')
b2sums=('a8ff6bd09b8a35682cfc2c0e2ae6346d42dedbb48089e040d1d88a7d3e5fb46247f4d2785c8a9bc7d8f87f322c072b97b88afd853fdd612a044d60a5abf527fb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
