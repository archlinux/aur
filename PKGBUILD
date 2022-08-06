# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fGarch
_pkgver=4021.87
pkgname=r-${_pkgname,,}
pkgver=4021.87
pkgrel=1
pkgdesc='Rmetrics - Autoregressive Conditional Heteroskedastic Modelling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastica
  r-fbasics
  r-timedate
  r-timeseries
)
optdepends=(
  r-runit
  r-tcltk
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d3d0fa9865e5e74548b46b824222f4bfea836dec886e6d8d6004a109b66c766')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
