# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ballgown
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='Flexible, isoform-level differential expression analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-limma
  r-rcolorbrewer
  r-rtracklayer
  r-s4vectors
  r-sva
)
optdepends=(
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('715beec2c50d109236a6ae9ae71e58a18ab2fee1112df2bd54be2ea87ca8917d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
