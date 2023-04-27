# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hiAnnotator
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('41552afc8edefa272cc4e50cc7958b7e56a0359314b69260b934a6ed0a64615a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
