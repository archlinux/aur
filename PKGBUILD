#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspNetwork
_pkgver=0.96.0
pkgname=r-${_pkgname,,}
pkgver=0.96.0
pkgrel=1
pkgdesc="Network Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bootnet
  r-easybgm
  r-bdgraph
  r-corpcor
  r-dplyr
  r-foreach
  r-ggplot2
  r-gtools
  r-hdinterval
  r-huge
  r-isingsampler
  r-jaspbase
  r-jaspgraphs
  r-mvtnorm
  r-qgraph
  r-reshape2
  r-snow
  r-stringr
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('7f487ee469f08c5a0d1baa139d3fb8d899c4bd7252a14fc4f9d575f0f817505d')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
