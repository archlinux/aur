# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GUniFrac
_pkgver=1.6
pkgname=r-${_pkgname,,}
pkgver=1.6
pkgrel=3
pkgdesc='Generalized UniFrac Distances, Distance-Based Multivariate Methods and Feature-Based Univariate Methods for Microbiome Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-dirmult
  r-foreach
  r-ggplot2
  r-ggrepel
  r-lmertest
  r-matrixstats
  r-modeest
  r-rcpp
  r-rmutil
  r-statmod
  r-vegan
)
optdepends=(
  r-ade4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9678f85d3eaf1f5c4714a6d2115305d3adafe666398f19477e4b28cf7fcec54f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
