# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=makecdfenv
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=1.90.0
pkgrel=1
pkgdesc='CDF Environment Maker'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-affyio
  r-biobase
  r-zlibbioc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b9f156cdf0dd4a96c01b326f702e11ef452a111f9f70ee24d4aa21e47343572e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
