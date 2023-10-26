# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcrma
_pkgver=2.74.0
pkgname=r-${_pkgname,,}
pkgver=2.74.0
pkgrel=1
pkgdesc='Background Adjustment Using Sequence Information'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affy
  r-affyio
  r-biobase
  r-biocmanager
  r-biostrings
  r-xvector
)
optdepends=(
  r-affydata
  r-hgu95av2cdf
  r-hgu95av2probe
  r-splines
  r-tools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf1b786c4c10f87eeed374a411e9db0fa45d2f175114b2051a75958b3852361e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
