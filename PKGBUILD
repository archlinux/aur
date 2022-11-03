# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSim
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Computation of functional similarities between GO terms and gene products; GO enrichment analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-corpcor
  r-flexmix
  r-go.db
  r-graph
  r-org.hs.eg.db
  r-rbgl
  r-rcpp
  r-topgo
)
optdepends=(
  r-igraph
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ceee9f86ce1bd6ff4740b48e40a69a8310c9c7baf4a2614f06edf959430fbe43')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
