# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ranger
_pkgver=0.14.1
pkgname=r-${_pkgname,,}
pkgver=0.14.1
pkgrel=1
pkgdesc='A Fast Implementation of Random Forests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcppeigen
)
optdepends=(
  r-covr
  r-survival
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5d99401d555da1cfb11c70e59d1bb545ce48720073a06a2a32eb396f622dee1b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
