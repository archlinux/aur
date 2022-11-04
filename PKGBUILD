# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RpsiXML
_pkgver=2.38.0
pkgname=r-${_pkgname,,}
pkgver=2.38.0
pkgrel=4
pkgdesc='R interface to PSI-MI 2.5 files'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-graph
  r-hypergraph
  r-rbgl
  r-xml
)
optdepends=(
  r-org.dm.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-org.sc.sgd.db
  r-ppistats
  r-rgraphviz
  r-scisi
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('719df8cadff4d9133cde3cd9a7577318673f869452c6e7088e9768dd09bc9674')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
