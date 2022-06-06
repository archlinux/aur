# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-12
pkgname=r-${_pkgname,,}
pkgver=0.6.12
pkgrel=3
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
sha256sums=('58a5b476847081fd2d2ac76d9249732e78e2b5a09eb30f4f70e3654600a718a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
