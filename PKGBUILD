# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AffyCompatible
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=4
pkgdesc='Affymetrix GeneChip software compatibility'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-rcurl
  r-xml
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74393e8cec13d9299c24f25717c73300876f315df74d3f7a6a4fbbad158ee7ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
