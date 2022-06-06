# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNPlocs.Hsapiens.dbSNP150.GRCh38
_pkgver=0.99.20
pkgname=r-${_pkgname,,}
pkgver=0.99.20
pkgrel=3
pkgdesc='SNP locations for Homo sapiens (dbSNP Build 150)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg38
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72328aef923e248c55f1803c15f4bc81f8a9c1d110e11f27f239d5dbfbe37c4a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
