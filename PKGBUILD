# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MADSEQ
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Mosaic Aneuploidy Detection and Quantification using Massive Parallel Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-coda
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-preprocesscore
  r-rjags
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
  r-vcfr
  r-vgam
  r-zlibbioc
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5e1abb453c235c78c6081f4ef40490dc879f6648a168803f1fc3a607772739ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
