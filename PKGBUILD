# system requirements: Cytoscape (>= 3.3.0), Java (>= 8)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGlincs
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Visualize all edges within a KEGG pathway and overlay LINCS data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-gtools
  r-hgu133a.db
  r-httr
  r-igraph
  r-kegggraph
  r-keggrest
  r-kodata
  r-org.hs.eg.db
  r-plyr
  r-rjsonio
  r-xml
)
optdepends=(
  r-biocmanager
  r-graph
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3157fa1f8df60e7fc160ad8f6961184b05a8539450718bb336cb54701cd2eac9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
