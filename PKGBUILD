# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=remaCor
_pkgver=0.0.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Random Effects Meta-Analysis for Correlated Test Statistics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-clustergeneration
  r-ggplot2
  r-mvtnorm
  r-rdpack
  r-reshape2
  r-runit
)
optdepends=(
  r-knitr
  r-metafor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('750699c75e46dbc6a654ad29be736d886da0bc3c8a259882785d9b2ff30f1342')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
