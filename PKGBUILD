# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=mgm
_pkgver=1.2-12
pkgname=r-${_pkgname,,}
pkgver=1.2.12
pkgrel=1
pkgdesc='Estimating Time-Varying k-Order Mixed Graphical Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-glmnet
  r-gtools
  r-hmisc
  r-qgraph
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0515b888742345d2260db2e25978a154e884dcc1e8440050ccf990ff580db45c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
