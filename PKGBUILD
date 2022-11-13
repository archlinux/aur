# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fGarch
_pkgver=4022.89
pkgname=r-${_pkgname,,}
pkgver=4022.89
pkgrel=1
pkgdesc='Rmetrics - Autoregressive Conditional Heteroskedastic Modelling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cvar
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
sha256sums=('b4a8727bd9d5f144a15f092fd4b855ca6417aba13e518e2f8d17364dc198c0ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
