# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OLINgui
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
pkgrel=1
pkgdesc='Graphical user interface for OLIN'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-marray
  r-olin
  r-tkwidgets
  r-widgettools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d0dd4467f8fefec1a7e839539a0132bedd8cfeb3324ef94a4ca2110d3edb65d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
