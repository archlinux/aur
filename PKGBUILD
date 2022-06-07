# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneAnswers
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=2.36.0
pkgrel=4
pkgdesc='Integrated Interpretation of Genes'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/GeneAnswers.html"
license=('LGPL')
depends=(
  r
  r-annotate
  r-biobase
  r-downloader
  r-heatplus
  r-igraph
  r-keggrest
  r-rbgl
  r-rcolorbrewer
  r-rcurl
  r-rsqlite
  r-xml
)
optdepends=(
  r-annotationdbi
  r-biomart
  r-go.db
  r-graph
  r-org.dm.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-reactome.db
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f5ee500199e11112b88b0624dd52133aa578611d70fc682f7708e90221c18b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
