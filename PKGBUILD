# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmpca
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=4
pkgdesc='Dimension Reduction of Non-Normally Distributed Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-covr
  r-ggplot2
  r-knitr
  r-logisticpca
  r-markdown
  r-matrix
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('048a9cdb303279275aa2b23bb01777dffdeaec0752709b382c2289f21e70b20b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
