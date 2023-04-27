# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GUIDEseq
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('b6aad825e0701c6ab77e572f4552a8244a22323fb2ca1a391ec08b98cc3a98c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
