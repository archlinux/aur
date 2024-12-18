# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clipper
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Gene Set Analysis Exploiting Pathway Topology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-biobase
  r-corpcor
  r-graph
  r-grbase
  r-igraph
  r-kegggraph
  r-qpgraph
  r-rcpp
)
optdepends=(
  r-all
  r-biocgenerics
  r-biocstyle
  r-graphite
  r-hgu95av2.db
  r-mass
  r-rcy3
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85f42a8c562abff2ce22c1949a5b3150feed656bb543766efe8f0643d481cadd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
