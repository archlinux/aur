# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=dotCall64
_pkgver=1.1-0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
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
sha256sums=('3484e32d5b2ff6e1b74963cc81e8dcb5c3dab0e1b1a5905898606cb6851370c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
