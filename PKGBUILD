# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pryr
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=0.1.5
pkgrel=4
pkgdesc='Tools for Computing on the Language'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lobstr
  r-rcpp
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b1653ec51850f4633cee8e2eb7d0b2724fb587b801539488b426cf88f0f770b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
