# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpcR
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=1.4.1
pkgrel=4
pkgdesc='Modelling and Analysis of Real-Time PCR Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-minpack.lm
  r-rgl
  r-robustbase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b6fd10577d8f33a31d6a7781435866de78373481c03f642f7a9f0b1e5c101e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
