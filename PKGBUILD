# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fBasics
_pkgver=4022.94
pkgname=r-${_pkgname,,}
pkgver=4022.94
pkgrel=1
pkgdesc='Rmetrics - Markets and Basic Statistics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gss
  r-stabledist
  r-timedate
  r-timeseries
)
optdepends=(
  r-interp
  r-runit
  r-tcltk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c83b0c466089ab35e1eadf0fbed7bf17b950658625a80e88d404cfc6b64a6ad6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
