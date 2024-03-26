# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fGarch
_pkgver=4033.92
pkgname=r-${_pkgname,,}
pkgver=4033.92
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
  r-goftest
  r-runit
  r-tcltk
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c835682001c05b178206c8394b3f7ec4e2b96a7d24f8e4ebc68dceae4367140d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
