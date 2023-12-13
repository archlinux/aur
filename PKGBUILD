# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kml
_pkgver=2.4.6.1
pkgname=r-${_pkgname,,}
pkgver=2.4.6.1
pkgrel=1
pkgdesc='K-Means for Longitudinal Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clv
  r-longitudinaldata
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a99c8f0d84645ef8a4e65053078c382e5a42b45fb1e02c8472c57eb6081f9e07')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
