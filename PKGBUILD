# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GUIDEseq
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='GUIDE-seq analysis pipeline'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-chippeakanno
  r-crisprseek
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-hash
  r-iranges
  r-limma
  r-matrixstats
  r-multtest
  r-openxlsx
  r-patchwork
  r-purrr
  r-rio
  r-rlang
  r-rsamtools
  r-s4vectors
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-knitr
  r-org.hs.eg.db
  r-runit
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d5b01e733baf6c8a602501fb0e0e616fb041852f343a596e93bfdbc418277988')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
