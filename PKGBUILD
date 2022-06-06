# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isva
_pkgver=1.9
pkgname=r-${_pkgname,,}
pkgver=1.9
pkgrel=4
pkgdesc='Independent Surrogate Variable Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastica
  r-jade
  r-qvalue
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9fd016e0b34034d271d45f8a0d0db62780bf0187112e45f610aa9237014e1d17')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
