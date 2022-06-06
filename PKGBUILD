# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsq
_pkgver=2.5
pkgname=r-${_pkgname,,}
pkgver=2.5
pkgrel=1
pkgdesc='R-Squared and Related Measures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-deriv
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6e9c58ba22d8d53de5cf491da229a8532abcdecf98484b4359c741d8b346c2e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
