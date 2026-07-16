# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pageRank
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Temporal and Multiplex PageRank for Gene Regulatory Network Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-igraph
  r-motifmatchr
)
optdepends=(
  r-annotate
  r-bcellviper
  r-bsgenome.hsapiens.ucsc.hg19
  r-genomicfeatures
  r-jaspar2018
  r-org.hs.eg.db
  r-tfbstools
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a3d6ebc3856c3a8d62000bd8cc5405a64e8c78692b485d4e611c44f137e2b4c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
