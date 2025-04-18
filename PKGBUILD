# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rTRM
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Identification of Transcriptional Regulatory Modules from Protein-Protein Interaction Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dbi
  r-igraph
  r-rsqlite
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biomart
  r-biostrings
  r-bsgenome.mmusculus.ucsc.mm8.masked
  r-ggplot2
  r-graph
  r-knitr
  r-motifdb
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pwmenrich
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('961e08a84aa5a68b48a3c41cef0d3d4ee6b246fa531f029af609e8573afbc5a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
