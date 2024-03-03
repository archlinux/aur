# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PolynomF
_pkgver=2.0-8
pkgname=r-${_pkgname,,}
pkgver=2.0.8
pkgrel=1
pkgdesc='Polynomials in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72675174eeb164ea335b49f2995447cd9b4e8662f72c3f5b47e9ffb8413c24f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
