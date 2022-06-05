# system requirements: Graphviz version >= 2.2
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellNOptR
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Training of boolean logic models of signalling networks using prior knowledge networks and perturbation data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-graph
  r-hash
  r-igraph
  r-rbgl
  r-rcurl
  r-rgraphviz
  r-stringi
  r-stringr
  r-xml
  graphviz
)
optdepends=(
  r-biocgenerics
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-plyr
  r-readr
  r-runit
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('290c3393f30b00de013ba2041d25d11e3abdea0c43cfffbd82d709debcf9e00e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
