# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lassopv
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=4
pkgdesc='Nonparametric P-Value Estimation for Predictors in Lasso'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f65b1fe1b0d4e700c0a7129db12333bd2cad2523df998c7bc5e0e03b8b45c79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
