# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=supersigs
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Supervised mutational signatures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biostrings
  r-caret
  r-dplyr
  r-rlang
  r-rsample
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a100e02bc138bb2322b6645f95907cd171dd059bc9c0063c4ac0116df811a9d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
