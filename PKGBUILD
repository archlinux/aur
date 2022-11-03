# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowSpecs
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Tools for processing of high-dimensional cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-flowcore
  r-ggplot2
  r-reshape2
  r-zoo
  r-hexbin
)
optdepends=(
  r-biocstyle
  r-depecher
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('990138f6d398aef695014b142a51bc40dc174b3b834e58203b366ba093abc0f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
