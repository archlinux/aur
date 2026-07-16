# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VariantExperiment
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='A RangedSummarizedExperiment Container for VCF/GDS Data with GDS Backend'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-delayedarray
  r-delayeddataframe
  r-gdsarray
  r-gdsfmt
  r-genomicranges
  r-iranges
  r-s4vectors
  r-seqarray
  r-snprelate
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88397cb5ce01a31f59b33883ec9f1fb65617714fc39ffd23c6273f39519540f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
