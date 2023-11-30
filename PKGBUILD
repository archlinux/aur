# system requirements: little-endian platform
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fstcore
_pkgver=0.9.16
pkgname=r-${_pkgname,,}
pkgver=0.9.16
pkgrel=1
pkgdesc="R Bindings to the 'Fstlib' Library"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MPL2')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-lintr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c92ea97b88d1f0a9156d56256a9e553f2b7f8b9b994874f6af0e37276b8f2b39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
