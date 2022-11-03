# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSCA
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='GSCA: Gene Set Context Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gplots
  r-rcolorbrewer
  r-reshape2
  r-rhdf5
  r-shiny
  r-sp
)
optdepends=(
  r-affyhgu133a2expr
  r-affyhgu133aexpr
  r-affyhgu133plus2expr
  r-affymoe4302expr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba3152e059893d6cf18e83ff38de84cc263de387f9df8dcd86cfe0863e2b6e6b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
