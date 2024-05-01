# system requirements: graphviz
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hyperdraw
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Visualizing Hypergaphs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-hypergraph
  r-rgraphviz
  graphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e5c57a7b740d7ff3e8e4f7c2dadf6a945d45ae86d61d5a09e6afe09d64e49d80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
