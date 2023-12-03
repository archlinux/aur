# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VplotR
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=1.12.1
pkgrel=1
pkgdesc='Set of tools to make V-plots and compute footprint profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-rcolorbrewer
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-zoo
)
optdepends=(
  r-covr
  r-genomicfeatures
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-testthat
  r-txdb.scerevisiae.ucsc.saccer3.sgdgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb40bd7ceedf8e733a3a8105a6d69dff1ed19190c9688d590f49edc7676ccc74')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
