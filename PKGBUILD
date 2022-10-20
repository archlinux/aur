# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnstruct
_pkgver=1.0.13
pkgname=r-${_pkgname,,}
pkgver=1.0.13
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
sha256sums=('e38d907a9a0814f19af375630c093a8363aa611ed4036e0d3f88610b6da64c59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
