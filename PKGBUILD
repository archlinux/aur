# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecp
_pkgver=3.1.3
pkgname=r-${_pkgname,,}
pkgver=3.1.3
pkgrel=4
pkgdesc='Non-Parametric Multiple Change-Point Analysis of Multivariate Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-combinat
  r-mass
  r-mvtnorm
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a80ab10bafe30cc96287b9220e44c4b4eda40f5dd0546e4d2a2e1baab514c058')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
