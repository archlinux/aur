# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cliProfiler
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='A package for the CLIP data visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-dplyr
  r-genomicranges
  r-ggplot2
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bookdown
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d4a72146a377bf0b36dd9b9891eb15fe5d111134dbd8c36a640990dd58f1677f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
