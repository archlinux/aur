# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PSCBS
_pkgver=0.68.0
pkgname=r-${_pkgname,,}
pkgver=0.68.0
pkgrel=1
pkgdesc='Analysis of Parent-Specific DNA Copy Numbers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-aroma.light
  r-dnacopy
  r-future
  r-listenv
  r-matrixstats
  r-r.cache
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-ggplot2
  r-hmisc
  r-r.devices
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('877161162649ed96e009bcbc4222fbd8c2f2a5f79b3b6ff75c3802f3e8235ef7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
