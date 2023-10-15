# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fGarch
_pkgver=4031.90
pkgname=r-${_pkgname,,}
pkgver=4031.90
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
sha256sums=('bf704b3546cc97fad8f613271b79ea04476f8b4bed0fb86023edb03aad91341a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
