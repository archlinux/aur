# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qap
_pkgver=0.1-2
pkgname=r-${_pkgname,,}
pkgver=0.1.2
pkgrel=1
pkgdesc='Heuristics for the Quadratic Assignment Problem (QAP)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47a4ada3ae7a3a5c9304174bd5291daad60d329d527c0c6bb5ec1ac257584da5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
