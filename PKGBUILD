# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.data
_pkgver=6.0-2
pkgname=r-${_pkgname,,}
pkgver=6.0.2
pkgrel=4
pkgdesc='Data for Generalised Additive Models for Location Scale and Shape'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dbb3b6f855540928ccdbda497f8d552144895e34565799e8b595e704096db71e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
