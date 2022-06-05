# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.numbers
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=4
pkgdesc='Assertions to Check Properties of Numbers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bae18c0b9e5b960a20636e127eb738ecd8a266e5fc29d8bc5ca712498cd68349')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
