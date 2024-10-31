# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sights
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('957a172f0f97c6228405a82acc954df302f42e9e81a44545581bdf57a47ff900')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
