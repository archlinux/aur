# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nls2
_pkgver=0.3-3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=4
pkgdesc='Non-linear regression with brute force'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proto
)
optdepends=(
  r-lhs
  r-nlstools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74d2fa178320823b98ddb72118d968ab9852f82123ae7183bb3289775dc7b116')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
