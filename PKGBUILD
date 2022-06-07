# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dualKS
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Dual KS Discriminant Analysis and Classification'
arch=('any')
url="https://bioconductor.org/packages/3.13/bioc/html/dualKS.html"
license=('LGPL')
depends=(
  r
  r-affy
  r-biobase
)
source=("https://bioconductor.org/packages/3.13/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab4508a8f7f08d6409b6e00fce91d8e32c3c3706a38391825bdfd45571598d8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
