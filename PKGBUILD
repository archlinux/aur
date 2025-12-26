# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=topGO
_pkgver=2.62.0
pkgname=r-${_pkgname,,}
pkgver=2.62.0
pkgrel=1
pkgdesc='Enrichment Analysis for Gene Ontology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-go.db
  r-graph
  r-matrixstats
  r-sparsem
)
optdepends=(
  r-all
  r-genefilter
  r-globaltest
  r-hgu133a.db
  r-hgu95av2.db
  r-multtest
  r-rgraphviz
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6bca31c56f2e71b763f7540a1b5b0ab197d36fd876b5f3f8d37e3b9bc928e9e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
