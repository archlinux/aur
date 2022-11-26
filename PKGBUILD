# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=conquer
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=5
pkgdesc='Convolution-Type Smoothed Quantile Regression'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-matrixstats
  r-rcpp
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14c28ab47b60c39696f34ee6fdd737bdcd2d28d05b3641c0e89960ab14a8bcd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
