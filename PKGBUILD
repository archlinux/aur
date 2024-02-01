# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=tsDyn
_pkgver=11.0.4.1
pkgname=r-${_pkgname,,}
pkgver=11.0.4.1
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
sha256sums=('38af697636d2cb02c11a46fd109a35b29ac57e4f193d61a0bf7a256c8c9b8713')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
