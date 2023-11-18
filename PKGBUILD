# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qtl
_pkgver=1.62
pkgname=r-${_pkgname,,}
pkgver=1.62
pkgrel=1
pkgdesc='Tools for Analyzing QTL Experiments'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('932f26d33a7471501b44950e3abba875507a1b09e396f2e8d59040c5a9ba1f4c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
