# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tilingArray
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=1.90.0
pkgrel=1
pkgdesc='Transcript mapping with high-density oligonucleotide tiling arrays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-biobase
  r-genefilter
  r-pixmap
  r-rcolorbrewer
  r-strucchange
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57f22f3a5625ec171613ada17a2ef71ed12119377966120973e66c4ce39ee555')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
