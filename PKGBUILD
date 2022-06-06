# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distillery
_pkgver=1.2-1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=4
pkgdesc='Method Functions for Confidence Intervals and to Distill Information from an Object'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b88f0b34e472b9134ad403fb32283424f1883a5943e52c55f1fe05995efb5fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
