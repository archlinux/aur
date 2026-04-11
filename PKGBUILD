# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PerformanceAnalytics
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=2.1.0
pkgrel=1
pkgdesc='Econometric Tools for Performance and Risk Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quadprog
  r-xts
  r-zoo
)
optdepends=(
  r-dygraphs
  r-gamlss
  r-gamlss.dist
  r-ggplot2
  r-ggpubr
  r-googlevis
  r-gridextra
  r-hmisc
  r-mass
  r-plotly
  r-quantmod
  r-quantreg
  r-r.rsp
  r-rcolorbrewer
  r-robstattm
  r-robustbase
  r-rpese
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc801d39382818cd3a7052326b45d078302aef4d290c85dab83498ed4516d58d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
