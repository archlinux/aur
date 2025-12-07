# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fBasics
_pkgver=4052.98
pkgname=r-${_pkgname,,}
pkgver=4052.98
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
sha256sums=('d2af0b19cfc964838f0c8d0f0a0a4416f61c14a733d80c501ca990c264210edd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
