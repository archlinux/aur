# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSNNS
_pkgver=0.4-18
pkgname=r-${_pkgname,,}
pkgver=0.4.18
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
sha256sums=('08a9fa31d89e2048aa71b2cfad20e12097411dfb2f9b405e94fc8b9ec4859d91')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
