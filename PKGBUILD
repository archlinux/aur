# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LinkHD
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='LinkHD: a versatile framework to explore and integrate heterogeneous data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-emmeans
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-multiassayexperiment
  r-reshape2
  r-rio
  r-scales
  r-vegan
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mass
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bbafeae8f558b07bed52e116246e51a6a97920edabf0efeb028f712381d7fe2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
