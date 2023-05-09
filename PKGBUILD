# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSNNS
_pkgver=0.4-16
pkgname=r-${_pkgname,,}
pkgver=0.4.16
pkgrel=1
pkgdesc='Neural Networks using the Stuttgart Neural Network Simulator (SNNS)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-neuralnettools
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a215fdb04a39e94eb3c21a9e66dff76f089d3310cb585cdfba5a66253a232d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
