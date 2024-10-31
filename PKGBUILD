# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affy
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=1.84.0
pkgrel=1
pkgdesc='Methods for Affymetrix Oligonucleotide Arrays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affyio
  r-biobase
  r-biocgenerics
  r-biocmanager
  r-preprocesscore
  r-zlibbioc
)
optdepends=(
  r-affydata
  r-hgu95av2cdf
  r-tkwidgets
  r-widgettools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c39cd36c731cb82ce2ee61e151206ecc902b5d736edbb23f3db5dca8f16247f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
