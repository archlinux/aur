# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AffyRNADegradation
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Analyze and correct probe positional bias in microarray data due to RNA degradation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
)
optdepends=(
  r-ampaffyexample
  r-hgu133acdf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a447818af98a248c9267e4972c78d6ea4eab3046abcd7cca6fc5372dcdd18ca6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
