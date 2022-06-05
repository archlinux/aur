# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=4.7.1
pkgname=r-${_pkgname,,}
pkgver=4.7.1
pkgrel=3
pkgdesc='Bayesian Network Structure Learning, Parameter Learning and Inference'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gmp
  r-grain
  r-graph
  r-igraph
  r-lattice
  r-parallel
  r-rgraphviz
  r-rmpfr
  r-rocr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('243930daa7f71c63fe1aa6717e5d55a116a597b83e08745cbcbe9a418d7c1509')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
