# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=longitudinal
_pkgver=1.1.13
pkgname=r-${_pkgname,,}
pkgver=1.1.13
pkgrel=4
pkgdesc='Analysis of Multiple Time Course Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57f04a0f387c1cc30d2feb945dc3ed35d2a304d94d21d3bc2cac8c92571fdc10')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
