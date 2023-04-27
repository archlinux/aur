# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSCA
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
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
sha256sums=('81647bf613c0beadfbd5e1630217d540ce42c91507aa7162c092581164d7abcf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
