# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.apd
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
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
sha256sums=('d30f3bcfa756958107f3b3f1e11151278463dcc36da7bdc66819864ab4b6c82f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
