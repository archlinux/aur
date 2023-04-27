# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwOmics
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06e09700c1b4a79a7e2188f7243fdd3175ec7a4cf26095ed92ef9776133902de')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
