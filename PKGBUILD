# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterSim
_pkgver=0.51-4
pkgname=r-${_pkgname,,}
pkgver=0.51.4
pkgrel=1
pkgdesc='Searching for Optimal Clustering Procedure for a Data Set'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-e1071
  r-r2html
)
optdepends=(
  r-mlbench
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('764e7b89a4d71e394ba8baff409396e8a2229a199e7a7975ebf5d8def98272af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
