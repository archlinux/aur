# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayQuality
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=1.90.0
pkgrel=1
pkgdesc='Assessing array quality on spotted arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-gridbase
  r-hexbin
  r-limma
  r-marray
  r-rcolorbrewer
)
optdepends=(
  r-heebodata
  r-mclust
  r-meebodata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe4df4d96ee5713f4b55abc93127720c1dfdc6ab3726f4ab5b7b6a8edafe2b79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
