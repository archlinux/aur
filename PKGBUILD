# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=panp
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Presence-Absence Calls from Negative Strand Matching Probesets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
)
optdepends=(
  r-gcrma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e6b9a92abe81907cac2a1de3f95af3a68034212991886461fcf78deae5cb070')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
