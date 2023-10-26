# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=muscle
_pkgver=3.44.0
pkgname=r-${_pkgname,,}
pkgver=3.44.0
pkgrel=1
pkgdesc='Multiple Sequence Alignment with MUSCLE'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-biostrings
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd98b350ad010b727c8c993b5056db2b0aca3349dbf2452e3d8e9acce502b272')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
