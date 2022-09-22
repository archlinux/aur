# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=4.8.1
pkgname=r-${_pkgname,,}
pkgver=4.8.1
pkgrel=1
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
sha256sums=('623c1bf0b3a38ee2060908c3197b763339115246dd72fb063f9476c7a54cd3ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
