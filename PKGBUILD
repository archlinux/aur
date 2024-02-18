# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=splus2R
_pkgver=1.3-5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
pkgrel=1
pkgdesc='Supplemental S-PLUS Functionality in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e7b0ea5672c5480424b056f3c30edc7858f868d3e2d7f5a3593e17fed5bfeb24')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
