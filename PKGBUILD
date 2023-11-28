# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=dotCall64
_pkgver=1.1-1
pkgname=r-${_pkgname,,}
pkgver=1.1.1
pkgrel=1
pkgdesc='Enhanced Foreign Function Interface Supporting Long Vectors'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-microbenchmark
  r-rcolorbrewer
  r-rhpcblasctl
  r-roxygen2
  r-spam
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('21b8d7d747c07aaf8a82d61ec98fe0539afcaa5a565d9c2fc55be65b6af2c91b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
