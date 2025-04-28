# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hiAnnotator
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Functions for annotating GRanges objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsgenome
  r-dplyr
  r-foreach
  r-genomicranges
  r-ggplot2
  r-iterators
  r-rtracklayer
  r-scales
)
optdepends=(
  r-biocgenerics
  r-doparallel
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df4cb070e9bb1d1ce3669cbaaf1e57307e19b9b8c171edfc762a624a78d8869d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
