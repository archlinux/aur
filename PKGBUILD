# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=periodicDNA
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Set of tools to identify periodic occurrences of k-mers in DNA sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-cowplot
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-rtracklayer
  r-s4vectors
  r-zoo
)
optdepends=(
  r-bsgenome.celegans.ucsc.ce11
  r-bsgenome.dmelanogaster.ucsc.dm6
  r-bsgenome.drerio.ucsc.danrer10
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-covr
  r-knitr
  r-pkgdown
  r-reticulate
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('059de5740c71d1a36459bb03c41962c52732f0922ff6e7863c4cc8acdfea8d0f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
