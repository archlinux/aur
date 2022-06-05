# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=corrgram
_pkgver=1.14
pkgname=r-${_pkgname,,}
pkgver=1.14
pkgrel=4
pkgdesc='Plot a Correlogram'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gridbase
  r-knitr
  r-matrix
  r-psych
  r-rmarkdown
  r-seriation
  r-sfsmisc
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('619f72c3319f6d10f30da032e8d3fab5a5d4d9581a715166efbfb67c15dfb089')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
