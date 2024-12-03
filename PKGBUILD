# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdm
_pkgver=1.6.0-4
pkgname=r-${_pkgname,,}
pkgver=1.6.0.4
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
sha256sums=('93794ec4211c7d970ae245bd4b4e7a7426449f5a0610a2441f5961b8647e87bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
