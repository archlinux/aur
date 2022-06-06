# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=4
pkgdesc='Build Regular Expressions in a Human Readable Way'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-rebus.base
  r-rebus.datetimes
  r-rebus.numbers
  r-rebus.unicode
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d3df9da8d95c7ed299052f8cfd849ac4beae7c187ca779997033bf04c6d4357')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
