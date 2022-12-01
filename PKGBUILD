# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdm
_pkgver=1.5.0-9.1
pkgname=r-${_pkgname,,}
pkgver=1.5.0.9.1
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
sha256sums=('c86286aa9dbcf4881aee1952f80b64cce04c1746992188743424b575cd748481')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
