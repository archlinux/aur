# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdm
_pkgver=1.6.0-3
pkgname=r-${_pkgname,,}
pkgver=1.6.0.3
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
sha256sums=('73dad8ac36529de39a70b00063100cdb0149cc7e5daeaca924ae234f63644cfe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
