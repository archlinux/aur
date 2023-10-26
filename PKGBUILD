# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVPanelizer
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Reliable CNV detection in targeted sequencing applications'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-exomecopy
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gplots
  r-iranges
  r-noiseq
  r-openxlsx
  r-plyr
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-shiny
  r-shinyfiles
  r-shinyjs
  r-stringr
  r-testthat
)
optdepends=(
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6d97880f6c4c22cc6171206758dd1f5ebc3cdd0a360327d5cda3c73dfbc0896')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
