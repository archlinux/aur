# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.types
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=8
pkgdesc='Assertions to Check Types of Variables'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.properties
)
optdepends=(
  r-data.table
  r-dplyr
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab6db2eb926e7bc885f2043fab679330aa336d07755375282d89bf9f9d0cb87f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
