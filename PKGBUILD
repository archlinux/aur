# system requirements: Java JDK 8 or higher
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcdk
_pkgver=3.6.0
pkgname=r-${_pkgname,,}
pkgver=3.6.0
pkgrel=4
pkgdesc="Interface to the 'CDK' Libraries"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-fingerprint
  r-iterators
  r-itertools
  r-png
  r-rcdklibs
  r-rjava
  java-runtime
)
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-runit
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9dd1978af1f8a930ab1ecad123395b1c31f58669d2e771951e9766280009716c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
