# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dotCall64
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=1.0.2
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
sha256sums=('e0c7728aebbea5ebf06dfeefae4fc0a240e6dde7c2bf13f2ed041b91d337a4ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
