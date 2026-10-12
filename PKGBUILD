# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=2.6.11
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
md5sums=('eedd63f95574b3c4426925057982b682')
b2sums=('514520cd6228f98b09665274e5ab0255af5f5ef7922e064b4b8e7e67aeab508519626e79f746825b49260771d587a8db41d96adb22dcd6e4ab3eeb26bffd70e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
