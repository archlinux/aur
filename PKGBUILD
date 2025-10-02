# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccaPP
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=0.3.5
pkgrel=1
pkgdesc='(Robust) Canonical Correlation Analysis via Projection Pursuit'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-pcapp
  r-rcpp
  r-rcpparmadillo
  r-robustbase
)
optdepends=(
  r-knitr
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b37a99c47269f8705d3230d1fe60efbdd275946326395b18316e9c4a6c14fe48')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
