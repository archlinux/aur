# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.models
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=4
pkgdesc='Assertions to Check Properties of Models'
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
sha256sums=('b9a6d8786f352d53371dbe8c5f2f2a62a7866e30313f268e69626d5c3691c42e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
