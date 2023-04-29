# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylumi
_pkgver=2.46.0
pkgname=r-${_pkgname,,}
pkgver=2.46.0
pkgrel=1
pkgdesc='Handle Illumina methylation data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-fdb.infiniummethylation.hg19
  r-genefilter
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-illuminaio
  r-iranges
  r-matrixstats
  r-minfi
  r-reshape2
  r-s4vectors
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-biostrings
  r-fdb.infiniummethylation.hg18
  r-homo.sapiens
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-knitr
  r-lattice
  r-limma
  r-lumi
  r-mass
  r-matrixstats
  r-parallel
  r-rtracklayer
  r-sqn
  r-tcgamethylation450k
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8e7e5b4a1f0c7678da6cdf2763ae2932bf6611e29858d22b51e98aeb25bf40a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
