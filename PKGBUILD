# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deltaGseg
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='deltaGseg'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-changepoint
  r-fbasics
  r-ggplot2
  r-pvclust
  r-reshape
  r-scales
  r-tseries
  r-wavethresh
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e99e5add8fbf8ac3c915473af2a2182457d8f24f06b4b2a26d622f2a6801f178')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
