# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mvoutlier
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=2.1.1
pkgrel=4
pkgdesc='Multivariate Outlier Detection Based on Robust Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-robustbase
  r-sgeostat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a2b48bc6f07c5bf77d35555c0934c21d9b7ee171f5c60e0589a6d8dbcfe86d2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
