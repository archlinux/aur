# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggnewscale
_pkgver=0.4.7
pkgname=r-${_pkgname,,}
pkgver=0.4.7
pkgrel=3
pkgdesc="Multiple Fill and Colour Scales in 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
)
optdepends=(
  r-covr
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b12ac9947fd3161941b2bb85c00a18d5fc794ad8b1e22a6f37f63ac8d3f0a81')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
