# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eisaR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('850c8d6a2f0e46ca67f56fd1c3ab1b21152244ddb4152e83b5c0b60a3c7a5f3c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
