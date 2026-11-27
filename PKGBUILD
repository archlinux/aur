# system requirements: none
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontoProc
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="processing of ontologies of anatomy, cell lines, and so on"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-basilisk
  r-biobase
  r-biocfilecache
  r-dplyr
  r-dt
  r-ellmer
  r-graph
  r-httr
  r-igraph
  r-jsonlite
  r-magrittr
  r-ontologyindex
  r-ontologyplot
  r-r.utils
  r-rbgl
  r-reticulate
  r-rgraphviz
  r-s4vectors
  r-shiny
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-celldex
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
  r-magick
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d5d660bc1b05e55ab6870eddcb99cacb')
b2sums=('0651958e7a0a5231f7a880126c27b0e4f49e589455e51fdc4b5033c32fffb8116c2b1f29ece06881ed0f681a6ff82999a1cf5fa408960123f32aeaf7e8b0dd48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
