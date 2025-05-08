# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdm
_pkgver=1.6.0-7
pkgname=r-${_pkgname,,}
pkgver=1.6.0.7
pkgrel=1
pkgdesc='Generalized Dissimilarity Modeling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-foreach
  r-raster
  r-rcpp
  r-reshape2
  r-vegan
  r-pbapply
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47ce3b256c793e569c456b36f25f68ccb7e5522605461d4e5c30bc4e8947b92b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
