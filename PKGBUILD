# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aods3
_pkgver=0.4-1.2
pkgname=r-${_pkgname,,}
pkgver=0.4.1.2
pkgrel=4
pkgdesc='Analysis of Overdispersed Data using S3 Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-boot
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d5cfcea7c971ad5ebc9e87c4b7316dbc797ce86285f02514d84296e4feea465')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
