# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SparseSignatures
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='SparseSignatures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r-biostrings
  r-bsgenome
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-iranges
  r-nmf
  r-nnlasso
  r-nnls
  r-reshape2
  r-rhpcblasctl
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-bsgenome.hsapiens.1000genomes.hs37d5
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a37afacea1fcd9972cc9d669ca6af225c396f281fe0db0f2c971403a37b2d6be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
