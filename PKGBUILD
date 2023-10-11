# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BWStest
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=0.2.3
pkgrel=1
pkgdesc='Baumgartner Weiss Schindler Test of Equal Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-memoise
  r-rcpp
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4bc4cc27fcf0aa60c6497048b74528923aae852c98480900204835a8ebd714b2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
