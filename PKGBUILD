# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MADSEQ
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('963adfd33a8c430ac10763d043403f982f01056e58d24515e3a9e838fec334c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
