# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fBasics
_pkgver=3042.89.1
pkgname=r-${_pkgname,,}
pkgver=3042.89.1
pkgrel=4
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
sha256sums=('ad242043c2e7d2788706518570596e3ff7f536e09008ed87656de93d930b1dd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
