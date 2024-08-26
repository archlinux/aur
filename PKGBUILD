# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecp
_pkgver=3.1.6
pkgname=r-${_pkgname,,}
pkgver=3.1.6
pkgrel=1
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
sha256sums=('e5c3ea82afd11452c6069ac27744f3de81e7e633189e1e5a5941dae1d786aac6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
