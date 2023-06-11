# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterSim
_pkgver=0.51-3
pkgname=r-${_pkgname,,}
pkgver=0.51.3
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
sha256sums=('01997dd2df58075c3791bbf3bd9245bbc40424c72ade2f194f7238004eca9a72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
