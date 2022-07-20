# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rdpack
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=2.3.1
pkgrel=1
pkgdesc='Update and Manipulate Rd Documentation Objects'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rbibutils
)
optdepends=(
  r-gbrd
  r-grdevices
  r-rprojroot
  r-rstudioapi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b53e5e9db53e31f514e2fef46bafa00bc7cd8828e36e5c933e28e9ac892d448a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
