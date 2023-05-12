#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspNetwork
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
pkgrel=1
pkgdesc="Network Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bootnet
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
sha256sums=('4450a1986160c64888c2cf605fabb9d1afda15f96adfbbdfb29d7b7ca5b54b9f')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
