# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dgof
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=4
pkgdesc='Discrete Goodness-of-Fit Tests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('714bcf89ee11c9c7147b7aa5009d60b5625de8eac3168a66011d8611e258160b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
