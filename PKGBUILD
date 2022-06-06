# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fit.models
_pkgver=0.64
pkgname=r-${_pkgname,,}
pkgver=0.64
pkgrel=4
pkgdesc='Compare Fitted Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f70806bfa85a05337fa5a665264d640e307584714a07a329fbe96c86b0e864da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
