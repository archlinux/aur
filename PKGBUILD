# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=2.6.15
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
md5sums=('60363e233c2b2bcd8683f5352f820815')
b2sums=('0fbf35f290ddb473f591f8ddaa50e408cd082f76438e5584ccbf179ee27749de50d95d9dc1d4a6582b08ab8bc5528af0a760fc49a617d18ce8c2ebb037fcddb8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
