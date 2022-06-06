# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSNNS
_pkgver=0.4-14
pkgname=r-${_pkgname,,}
pkgver=0.4.14
pkgrel=4
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
sha256sums=('7f6262cb2b49b5d5979ccce9ded9cbb2c0b348fd7c9eabc1ea1d31c51a102c20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
