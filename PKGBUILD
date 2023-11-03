# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fBasics
_pkgver=4032.96
pkgname=r-${_pkgname,,}
pkgver=4032.96
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
sha256sums=('e1556909871c836668b10bf90e1676aac6a2892a04663d7ab00c22a64c0b8690')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
