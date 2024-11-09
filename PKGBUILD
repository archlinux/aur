# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOMA
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Multi Omic Master Regulator Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-circlize
  r-complexheatmap
  r-dplyr
  r-ggplot2
  r-magrittr
  r-mkmisc
  r-multiassayexperiment
  r-qvalue
  r-rcolorbrewer
  r-readr
  r-reshape2
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-viper
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f0517e4a80e044205f283d6627e84baeec7748f03f4abc47aeafaddce9f5c129')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
