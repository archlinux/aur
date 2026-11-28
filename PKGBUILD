# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=3.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Set Variation Analysis for Microarray and RNA-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotate
  r-annotationdbi
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
  r-rhdf5
  r-s4arrays
  r-s4vectors
  r-singlecellexperiment
  r-sparsearray
  r-sparsematrixstats
  r-spatialexperiment
  r-summarizedexperiment
)
optdepends=(
  r-arrow
  r-batchtools
  r-biocstyle
  r-bluster
  r-data.table
  r-dbi
  r-doparallel
  r-duckdb
  r-edger
  r-experimenthub
  r-foreach
  r-future
  r-genefilter
  r-ggplot2
  r-ggspavis
  r-gsvadata
  r-igraph
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-parallelly
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
md5sums=('3ae13808434d2cebbac9c33fb4057aaa')
b2sums=('24d02fbb55c89f019a1e9b34785cdfaabac16db465cfdc78aacb171dd19a142ba3b759f35ca268ec181cb77fec0d6585faaef8f55dc5fe8ed93ca097c1922dce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
