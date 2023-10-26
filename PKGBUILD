# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.strings
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=8
pkgdesc='Assertions to Check Properties of Strings'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.types
  r-stringi
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d541d608a01640347d661cc9a67af8202904142031a20caa270f1c83d0ccd258')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
