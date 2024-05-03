# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SWATH2stats
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Transform and Filter SWATH Data for Statistical Packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-data.table
  r-ggplot2
  r-reshape2
)
optdepends=(
  r-alfq
  r-knitr
  r-msstats
  r-peca
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('00e4c8eef08869c9619b78a6705869968a11a9f871ade8b7b97a60980bfc5614')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
