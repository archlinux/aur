# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=tsDyn
_pkgver=11.0.5.2
pkgname=r-${_pkgname,,}
pkgver=11.0.5.2
pkgrel=1
pkgdesc='Nonlinear Time Series Models with Regime Switching'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-foreach
  r-forecast
  r-mnormt
  r-tseries
  r-tserieschaos
  r-urca
  r-vars
)
optdepends=(
  r-rgl
  r-rugarch
  r-scatterplot3d
  r-sm
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e748c601827920fbaefa7c3d9f9f2fce0e91726d56bdb58dfc5180815c81c06c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
