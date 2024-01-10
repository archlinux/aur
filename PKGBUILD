# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnstruct
_pkgver=1.0.15
pkgname=r-${_pkgname,,}
pkgver=1.0.15
pkgrel=1
pkgdesc='Bayesian Network Structure Learning from Data with Missing Values'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bitops
  r-igraph
)
optdepends=(
  r-graph
  r-knitr
  r-qgraph
  r-rgraphviz
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5fffb6e0ba368077d621915dd9d64d5b2db3c82cb267be8d5b1d8868b0aec33f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
