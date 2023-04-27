# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agilp
_pkgver=3.32.0
pkgname=r-${_pkgname,,}
pkgver=3.32.0
pkgrel=1
pkgdesc='Agilent expression array processing package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9008534fc2650f1cf2438dc15ce9864a60a8901af5d30dd460e2286a321a666')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
