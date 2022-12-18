# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGgraph
_pkgver=1.58.2
pkgname=r-${_pkgname,,}
pkgver=1.58.2
pkgrel=1
pkgdesc='KEGGgraph: A graph approach to KEGG PATHWAY in R and Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-rcurl
  r-rgraphviz
  r-xml
)
optdepends=(
  r-hgu133plus2.db
  r-org.hs.eg.db
  r-rbgl
  r-rcolorbrewer
  r-spia
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ceba7ece2a8f66b363f0bfaa5b28397aa37e19b1f3f16df4ffb9b387b28163bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
