# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEGraph
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Two-sample tests on a graph'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-kegggraph
  r-mvtnorm
  r-ncigraph
  r-r.methodss3
  r-r.utils
  r-rbgl
  r-rgraphviz
  r-rrcov
)
optdepends=(
  r-corpcor
  r-fields
  r-graph
  r-kegggraph
  r-lattice
  r-marray
  r-ncigraph
  r-rbgl
  r-rgraphviz
  r-rrcov
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('daa7b146be6338e954241d66655249ddf545c69f579fb07bf4b0a7ce89e0d97a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
