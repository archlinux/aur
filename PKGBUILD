# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fBasics
_pkgver=4021.92
pkgname=r-${_pkgname,,}
pkgver=4021.92
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
  r-akima
  r-runit
  r-tcltk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('795135ce4655122b86edfd9888c649d9a303f2783b02e73041a7ec915a54c887')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
