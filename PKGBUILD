# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfit
_pkgver=1.5-9.6
pkgname=r-${_pkgname,,}
pkgver=1.5.9.6
pkgrel=1
pkgdesc='Local Regression, Likelihood and Density Estimation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gam
  r-interp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ee89e4003cb769feae61ada7ac0a971df30644824f7ed84a21dd5719f713476')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
