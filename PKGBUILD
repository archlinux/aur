# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeSeries
_pkgver=4021.105
pkgname=r-${_pkgname,,}
pkgver=4021.105
pkgrel=1
pkgdesc='Financial Time Series Objects (Rmetrics)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-timedate
)
optdepends=(
  r-ftrading
  r-performanceanalytics
  r-robustbase
  r-runit
  r-xts
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bfe36c964bb1d4b3c01d411e46081a2adaad6b4d7e04d8b3fca702a1178cdbcc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
