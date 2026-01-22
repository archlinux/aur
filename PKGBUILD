# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kohonen
_pkgver=3.0.13
pkgname=r-${_pkgname,,}
pkgver=3.0.13
pkgrel=1
pkgdesc='Supervised and Unsupervised Self-Organising Maps'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('056db0d8333ae37de6ca0af7056f401db61adcce2aaa982b63340a9b9af0a350')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
