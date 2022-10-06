# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggnewscale
_pkgver=0.4.8
pkgname=r-${_pkgname,,}
pkgver=0.4.8
pkgrel=1
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
sha256sums=('c7fefa6941ecbc789507e59be13fa96327fe2549681a938c43beb06ca22a9700')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
