# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=corral
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Correspondence Analysis for Single Cell Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggthemes
  r-gridextra
  r-irlba
  r-multiassayexperiment
  r-pals
  r-singlecellexperiment
  r-summarizedexperiment
  r-transport
  r-reshape2
)
optdepends=(
  r-ade4
  r-biocstyle
  r-cellbench
  r-duoclustering2018
  r-knitr
  r-rmarkdown
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6de00d987e1e76ece24259a0166a5d53b9b571c85a1ad9b804ff0087f7206e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
