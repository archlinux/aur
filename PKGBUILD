# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LinkHD
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('8e1cbeb2208d40330ffb2a8492523929b04611ff3ac0d901ee9d89bbaadf81c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
