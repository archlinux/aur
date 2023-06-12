# system requirements: Java JDK 8 or higher
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcdk
_pkgver=3.8.0
pkgname=r-${_pkgname,,}
pkgver=3.8.0
pkgrel=1
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
sha256sums=('166ac3c8bc67d68965f33e470eed2fa32831997ad432f1e36038b581f56daef7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
