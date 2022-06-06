# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=varhandle
_pkgver=2.0.5
pkgname=r-${_pkgname,,}
pkgver=2.0.5
pkgrel=4
pkgdesc='Functions for Robust Variable Handling'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b0ee653e0343e292547d2a7052e60a2e7d97d1d5528246862522e67346882d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
