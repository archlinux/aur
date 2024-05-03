# system requirements: Primer3 (>= 2.5.0), BLAST+ (>=2.6.0)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TAPseq
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Targeted scRNA-seq primer design for TAP-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-cowplot
  r-ggplot2
  r-glmnet
  r-knitr
  r-matrix
  r-rmarkdown
  r-rtracklayer
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('719cba203d2a4efd95277fc55b0b01d9728e293b376b7421d01159868c02e75b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
