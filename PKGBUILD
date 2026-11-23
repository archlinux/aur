# system requirements: none
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontoProc
_pkgver=2.6.0
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
md5sums=('2e7d35cc300c4ca8189b45cfb2886c2d')
b2sums=('5d4293ddd30e0859086dfe72b3ad1d40ff8dbfc7f6f5e23e3d111bf15405da1393c1ff51a4b705247a9354bd69de99b778f7c63cf2d51951ad869f910bc920d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
