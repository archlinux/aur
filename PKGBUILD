# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-13
pkgname=r-${_pkgname,,}
pkgver=0.6.13
pkgrel=1
pkgdesc='Data Structures and Algorithms for Relations'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sets
  r-slam
)
optdepends=(
  r-clue
  r-lpsolve
  r-methods
  r-rcplex
  r-rglpk
  r-rgraphviz
  r-rsymphony
  r-seriation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f859c336fb0c4a2df7f294b33d1d04f95c6988e5e76933e2e70bf291d904d9da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
