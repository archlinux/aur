# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affy
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=1.82.0
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
sha256sums=('be770650fec7477b478b7f03f0a3481b036bc2ee08a3dbcee4338fe60313e2a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
