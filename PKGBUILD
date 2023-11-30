# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSNNS
_pkgver=0.4-17
pkgname=r-${_pkgname,,}
pkgver=0.4.17
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
sha256sums=('424557d7326889e09e31e04d2a9b7224bed0bb4aa6f9e5433d7ce4fe04a35afc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
