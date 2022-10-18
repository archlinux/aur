# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DescTools
_pkgver=0.99.46
pkgname=r-${_pkgname,,}
pkgver=0.99.46
pkgrel=3
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
sha256sums=('5806d0982342ed31ed7b01afd0cda03fe77a1782d81e5f77e115edfff886d2b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
