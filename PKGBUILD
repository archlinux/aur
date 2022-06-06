# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mbest
_pkgver=0.6
pkgname=r-${_pkgname,,}
pkgver=0.6
pkgrel=4
pkgdesc='Moment-Based Estimation for Hierarchical Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-abind
  r-bigmemory
  r-foreach
  r-lme4
  r-logging
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7da32aa465f95d9ff1018e72a87cfe84252bbd3ccfd81e302f4319098b3f0ef4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
