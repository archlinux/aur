# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggforce
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=4
pkgdesc="Accelerating 'ggplot2'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggplot2
  r-gtable
  r-polyclip
  r-rcpp
  r-rcppeigen
  r-rlang
  r-scales
  r-tidyselect
  r-tweenr
  r-withr
)
optdepends=(
  r-concaveman
  r-covr
  r-deldir
  r-reshape2
  r-sessioninfo
  r-units
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a283bb409da6b96929863a926b153bcc59b2c6f00551805db1d1d43e5929f2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
