# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Lmoments
_pkgver=1.3-2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc='L-Moments and Quantile Mixtures'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ccb07c7cf9bc969d0a79c4e4182ab8846619bb51669e335d32170111741d05a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
