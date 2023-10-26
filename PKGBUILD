# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeSeries
_pkgver=4031.107
pkgname=r-${_pkgname,,}
pkgver=4031.107
pkgrel=3
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
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84386a342af69731024c524f0c28d28a18436b41ae94b9e60fdc67412bdab542')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
