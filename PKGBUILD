# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ATACseqQC
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='ATAC-seq Quality Control'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-chippeakanno
  r-edger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-genomicscores
  r-iranges
  r-limma
  r-motifstack
  r-preseqr
  r-randomforest
  r-rsamtools
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-motifdb
  r-phastcons100way.ucsc.hg19
  r-rmarkdown
  r-testthat
  r-trackviewer
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3173c69aae5a197be73b37b516683abb2f29bf4334e5d452388689d639d9955')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
