# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DescTools
_pkgver=0.99.45
pkgname=r-${_pkgname,,}
pkgver=0.99.45
pkgrel=1
pkgdesc='Tools for Descriptive Statistics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-data.table
  r-exact
  r-expm
  r-gld
  r-mvtnorm
  r-rcpp
  r-rstudioapi
  r-readxl
  r-httr
)
optdepends=(
  r-r.rsp
  r-rdcomclient
  r-tcltk
  r-vgam
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8dfe7057fdcec475bc444761b00db59f6fb7313fd39c7bd6aebeca7f67aceb05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
