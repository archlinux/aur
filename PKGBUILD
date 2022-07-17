# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeSeries
_pkgver=4021.104
pkgname=r-${_pkgname,,}
pkgver=4021.104
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
sha256sums=('f69ee98d9b47603f5ba87699074653ba51268a5a962539df497781b053520112')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
