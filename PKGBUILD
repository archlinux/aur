# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sights
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Statistics and dIagnostic Graphs for HTS'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-qvalue
  r-reshape2
)
optdepends=(
  r-ggthemes
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
  r-xlsx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a3d32db8d67574fae7855e3a6cb51e0bcfda3b1d92ec8a5cf3571a748a723e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
