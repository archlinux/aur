# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poweRlaw
_pkgver=0.80.0
pkgname=r-${_pkgname,,}
pkgver=0.80.0
pkgrel=1
pkgdesc='Analysis of Heavy Tailed Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-pracma
)
optdepends=(
  r-covr
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('713556af1f47e1de749670d08f963688908cfa80e9dfda590efd1a28441772cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
