# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minerva
_pkgver=1.5.10
pkgname=r-${_pkgname,,}
pkgver=1.5.10
pkgrel=4
pkgdesc='Maximal Information-Based Nonparametric Exploration for Variable Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f26353d8fcc989ac698c4e45bb683801b1a7bb60b14903d05a4d73c629c590f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
