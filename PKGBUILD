# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.data
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=8
pkgdesc='Assertions to Check Properties of Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.strings
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5a00fb48ad870d9b3c872ce3d6aa20a7948687a980f49fe945b455339e789b01')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
