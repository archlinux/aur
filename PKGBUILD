# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=r3Cseq
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Analysis of Chromosome Conformation Capture and Next-generation Sequencing (3C-seq)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-qvalue
  r-rcolorbrewer
  r-rsamtools
  r-rtracklayer
  r-sqldf
  r-vgam
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18.masked
  r-bsgenome.hsapiens.ucsc.hg19.masked
  r-bsgenome.mmusculus.ucsc.mm10.masked
  r-bsgenome.mmusculus.ucsc.mm9.masked
  r-bsgenome.rnorvegicus.ucsc.rn5.masked
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ee3e4a9751a41265719d171255151494aafdab19c90a8fb7544afd1604680cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
