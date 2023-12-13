# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=longitudinalData
_pkgver=2.4.5.1
pkgname=r-${_pkgname,,}
pkgver=2.4.5.1
pkgrel=1
pkgdesc='Longitudinal Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clv
  r-misc3d
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5b01753e56129ae30e8dcc47e06fcf7e3bc7bdc3060eb018f49d358a914f6f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
