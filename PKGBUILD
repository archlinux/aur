# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dotCall64
_pkgver=1.0-1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=4
pkgdesc='Enhanced Foreign Function Interface Supporting Long Vectors'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-microbenchmark
  r-openmpcontroller
  r-rcolorbrewer
  r-roxygen2
  r-spam
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f10b28fcffb9453b1d8888a72c8fd2112038b5ac33e02a481492c7bd249aa5c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
