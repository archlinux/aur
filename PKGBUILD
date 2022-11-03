# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tracktables
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Build IGV tracks and HTML reports'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-iranges
  r-rcolorbrewer
  r-rsamtools
  r-stringr
  r-tractor.base
  r-xml
  r-xvector
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf47aacfbee5acca2d35b9c1675f010c2fe3651fc8be6284811d09a074b0e9b2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
