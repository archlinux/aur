# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathwayPCA
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='Integrative Pathway Analysis with Modern PCA Methodology and Gene Selection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-lars
)
optdepends=(
  r-airway
  r-circlize
  r-grdevices
  r-knitr
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-survminer
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9530cff4c66bd8a3f4eec91c2461fb54d8bb169d88fa6fb29f09ab1253c1bd66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
