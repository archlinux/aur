# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.code
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=4
pkgdesc='Assertions to Check Properties of Code'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.properties
  r-assertive.types
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef80e8d1d683d776a7618e78ddccffca7f72ab4a0fcead90c670bb8f8cb90be2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
