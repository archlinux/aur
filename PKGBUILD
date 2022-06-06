# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deltaGseg
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('bbc9d3bb22e55f2fa264d0a08db1b40b0627758434ce07c6cb5058847a2557a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
