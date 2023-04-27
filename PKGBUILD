# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=savR
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=1.37.0
pkgrel=1
pkgdesc='Parse and analyze Illumina SAV files'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-ggplot2
  r-gridextra
  r-reshape2
  r-scales
  r-xml
)
optdepends=(
  r-cairo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aaa9fb13c19f25bc5152dc9e8940089fd1e793af1166d9ad87fcd6a6e3e1918f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
