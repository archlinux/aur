# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eisaR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Exon-Intron Split Analysis (EISA) in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-edger
  r-genomicranges
  r-iranges
  r-limma
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg38
  r-ensembldb
  r-genomicfeatures
  r-knitr
  r-quasr
  r-rbowtie
  r-rhisat2
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab4f6948af85c59d74064bc7b6bdd1e91a798d9e912654dc0626d8ed496f127a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
