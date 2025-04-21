# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=structToolbox
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Data processing & analysis tools for Metabolomics and other omics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggthemes
  r-gridextra
  r-scales
  r-sp
  r-struct
)
optdepends=(
  r-agricolae
  r-biocfilecache
  r-biocstyle
  r-car
  r-covr
  r-cowplot
  r-e1071
  r-emmeans
  r-ggdendro
  r-knitr
  r-magick
  r-nlme
  r-openxlsx
  r-pls
  r-pmp
  r-rappdirs
  r-reshape2
  r-rmarkdown
  r-ropls
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b751dc2cde21615733b43fd4988b418962e9b89e2744125de02160a3065fc0f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
