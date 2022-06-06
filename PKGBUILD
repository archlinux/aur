# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ribosomeProfilingQC
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Ribosome Profiling Quality Control'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-edaseq
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggfittext
  r-ggplot2
  r-ggrepel
  r-iranges
  r-motifstack
  r-rsamtools
  r-rsubread
  r-rtracklayer
  r-ruvseq
  r-s4vectors
  r-scales
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer10
  r-edger
  r-knitr
  r-limma
  r-rmarkdown
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad9fbcba8f10951f520ac7350e8b28eaa1024e46bf92a809d26ebff002caa7b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
