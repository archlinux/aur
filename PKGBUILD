# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.apd
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=0.6.0
pkgrel=4
pkgdesc="A Probe-Level Data File Format Used by 'aroma.affymetrix' [deprecated]"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-r.huge
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-affxparser
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87513774baeed8e1d43f819e615c85278aef748ebc842f1ee50686c3392e37d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
