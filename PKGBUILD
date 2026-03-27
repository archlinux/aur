# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bootnet
_pkgver=1.8
pkgname=r-${_pkgname,,}
pkgver=1.8
pkgrel=1
pkgdesc='Bootstrap Methods for Various Network Estimation Routines'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-corpcor
  r-dplyr
  r-ggplot2
  r-gtools
  r-igraph
  r-isingfit
  r-isingsampler
  r-mgm
  r-mvtnorm
  r-networktoolbox
  r-networktools
  r-pbapply
  r-qgraph
  r-rlang
  r-snow
  r-tibble
  r-tidyr
  r-tidyselect
  r-mantar
)
optdepends=(
  r-bdgraph
  r-ggmncv
  r-glasso
  r-graphicalvar
  r-huge
  r-lavaan
  r-psychtools
  r-relaimpo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('267265d74ad04ab2c913b401fa8b13bdae244bff965e1fc60f822952973db41f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
