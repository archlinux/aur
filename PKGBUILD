# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontoProc
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="processing of ontologies of anatomy, cell lines, and so on"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biobase
  r-biocfilecache
  r-dplyr
  r-dt
  r-graph
  r-httr
  r-igraph
  r-magrittr
  r-ontologyindex
  r-ontologyplot
  r-r.utils
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b97b2891024222d839bce78e279df49')
b2sums=('d64ba95b9d973b11d3222eac4a8665ea7522f79139dfe4abfc06940c868dfb9bb3668991e5444361f862e7b42427c9c82d9e2bdcfd515887492213e5c3c887d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
