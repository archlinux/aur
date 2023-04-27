# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deltaGseg
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
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
sha256sums=('25150f2f96501fd40341336530410eb77fd1ee28a1131b4bf7de8fd0962eae73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
