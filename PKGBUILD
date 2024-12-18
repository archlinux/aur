# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SomaticSignatures
_pkgver=2.42.0
pkgname=r-${_pkgname,,}
pkgver=2.42.0
pkgrel=1
pkgdesc='Somatic Signatures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-iranges
  r-nmf
  r-pcamethods
  r-proxy
  r-reshape2
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-bsgenome.hsapiens.1000genomes.hs37d5
  r-fastica
  r-ggdendro
  r-knitr
  r-parallel
  r-somaticcanceralterations
  r-sva
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7690623d4b37be550bf889c6efa734eddab98fcaf181f8000c9373b234737463')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
