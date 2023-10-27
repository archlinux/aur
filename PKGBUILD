# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive
_pkgver=0.3-6
pkgname=r-${_pkgname,,}
pkgver=0.3.6
pkgrel=8
pkgdesc='Readable Check Functions to Ensure Code Integrity'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.code
  r-assertive.data
  r-assertive.data.uk
  r-assertive.data.us
  r-assertive.datetimes
  r-assertive.files
  r-assertive.matrices
  r-assertive.models
  r-assertive.numbers
  r-assertive.properties
  r-assertive.reflection
  r-assertive.sets
  r-assertive.strings
  r-assertive.types
  r-knitr
)
optdepends=(
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c403169e83c433b65e911f7fd640b378e2a4a4765a36063584b8458168a4ea0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
