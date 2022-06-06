# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=princurve
_pkgver=2.1.6
pkgname=r-${_pkgname,,}
pkgver=2.1.6
pkgrel=4
pkgdesc='Fit a Principal Curve in Arbitrary Dimension'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-devtools
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0216332390eb27013b6ba62232782156dfc99ca640087fcaff53d2be9218f373')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
