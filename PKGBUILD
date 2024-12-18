# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=icetea
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Integrating Cap Enrichment with Transcript Expression Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-csaw
  r-deseq2
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
  r-summarizedexperiment
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rsubread
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cb0c2a4a343f6c84e8331e2656fd35e15226ceea4aeea6ca0072f4c3ecdfd3c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
