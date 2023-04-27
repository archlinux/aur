# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVPanelizer
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('3e9e5a627e1ad0dadc98c91d13a62cc6c7851fd1c7f38f13c6ee54565a8ab029')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
