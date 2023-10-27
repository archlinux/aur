# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sevenC
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Computational Chromosome Conformation Capture by Correlation of ChIP-seq at CTCF motifs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-interactionset
  r-iranges
  r-purrr
  r-readr
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-covr
  r-genomicinteractions
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82d883995a13847cd7139af0639d5d399679cf290db412fc8425028c8ed13acd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
