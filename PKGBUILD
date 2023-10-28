# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Risa
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Converting experimental metadata from ISA-tab into Bioconductor data structures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affy
  r-biobase
  r-biocviews
  r-rcpp
  r-xcms
)
optdepends=(
  r-faahko
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('58b0cbf8382040a2cc9842c870019e59285a3ee8f0784edf75ae1eaa49271890')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
