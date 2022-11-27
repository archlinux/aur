# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imcRtools
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc='Methods for imaging mass cytometry data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-biocneighbors
  r-biocparallel
  r-concaveman
  r-cytomapper
  r-data.table
  r-distances
  r-dplyr
  r-dt
  r-ebimage
  r-ggplot2
  r-ggraph
  r-igraph
  r-magrittr
  r-matrixgenerics
  r-pheatmap
  r-readr
  r-rtriangle
  r-s4vectors
  r-scuttle
  r-sf
  r-singlecellexperiment
  r-spatialexperiment
  r-stringr
  r-summarizedexperiment
  r-tidygraph
  r-tidyselect
  r-viridis
  r-vroom
)
optdepends=(
  r-biocstyle
  r-catalyst
  r-grid
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b82853d9601d172bc884c746e314bcd5f22ca2aced70d774df0301930666f34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
