# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwOmics
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Pathway-based data integration of omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biobase
  r-biocgenerics
  r-biomart
  r-data.table
  r-genomicranges
  r-gplots
  r-graph
  r-igraph
  r-rbiopaxparser
  r-stringdb
)
optdepends=(
  r-ebdbnet
  r-longitudinal
  r-mfuzz
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6fa38837a23f787e66987ca0508c36a59c914a56d1b04194c0faff53374a8101')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
