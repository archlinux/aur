# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterSim
_pkgver=0.50-1
pkgname=r-${_pkgname,,}
pkgver=0.50.1
pkgrel=6
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
sha256sums=('8a91671775362d51460e539d146ebd43b50be26edaa2fd2ed5bf259a70b89738')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
