# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathview
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='a tool set for pathway based data integration and visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-graph
  r-kegggraph
  r-keggrest
  r-org.hs.eg.db
  r-png
  r-rgraphviz
  r-xml
)
optdepends=(
  r-biocgenerics
  r-gage
  r-org.mm.eg.db
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b861a0bf041ea83a0edd6f3bfe3aa73cd1879e48373ad117752c08774098e290')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
