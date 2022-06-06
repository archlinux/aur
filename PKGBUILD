# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=estimability
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=4
pkgdesc='Tools for Assessing Estimability of Linear Predictions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a33179c5fbd6a1a623d90cb6f1743148f92c09429fac466867f3ea70946a2e32')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
