# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splots
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=1
pkgdesc='Visualization of high-throughput assays in microtitre plate or slide format'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rcolorbrewer
)
optdepends=(
  r-assertthat
  r-biocstyle
  r-hd2013sgi
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c36eca3f003051407acc7b85fc78765343c13cefbb5e7fc8f23e2b1dcd448405')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
