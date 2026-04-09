# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=ggsci
_pkgver=4.3.0
pkgname=r-${_pkgname,,}
pkgver=4.3.0
pkgrel=1
pkgdesc="Scientific Journal and Sci-Fi Themed Color Palettes for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-scales
)
optdepends=(
  r-gridextra
  r-knitr
  r-ragg
  r-reshape2
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5e1dac8fcff50761bbd924396b9ae28b2291fbd9ddb99a7c5bef341e3471e75f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
