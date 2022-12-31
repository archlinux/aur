# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kmlShape
_pkgver=0.9.5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=6
pkgdesc='K-Means for Longitudinal Data using Shape-Respecting Distance'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-kml
  r-longitudinaldata
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('617542d4981bb3ae5b839358e446b00c0706185d4d4f8f0efe561284258c65dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
