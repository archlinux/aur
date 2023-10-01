# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=varhandle
_pkgver=2.0.6
pkgname=r-${_pkgname,,}
pkgver=2.0.6
pkgrel=1
pkgdesc='Functions for Robust Variable Handling'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4e7afd3ef77343c61508b0465b588751dc089c264faabf7bed60e9f4d9e1c577')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
