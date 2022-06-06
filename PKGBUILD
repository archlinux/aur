# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rnits
_pkgver=1.29.0
pkgname=r-${_pkgname,,}
pkgver=1.29.0
pkgrel=1
pkgdesc='R Normalization and Inference of Time Series data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-ggplot2
  r-impute
  r-limma
  r-qvalue
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d034d60c8924200e662073c9e65fcd162b3d8af3ffd8f96cb55e9f9b5874ca54')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
