# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EventPointer
_pkgver=3.12.0
pkgname=r-${_pkgname,,}
pkgver=3.12.0
pkgrel=1
pkgdesc='An effective identification of alternative splicing events using junction arrays and RNA-Seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-abind
  r-affxparser
  r-biostrings
  r-bsgenome
  r-cobs
  r-doparallel
  r-fgsea
  r-foreach
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-glmnet
  r-graph
  r-igraph
  r-iranges
  r-iterators
  r-limma
  r-lpsolve
  r-matrixstats
  r-nnls
  r-poibin
  r-prodlim
  r-qvalue
  r-rbgl
  r-rhdf5
  r-s4vectors
  r-sgseq
  r-speedglm
  r-stringr
  r-summarizedexperiment
  r-tximport
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-dplyr
  r-kableextra
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('11dcf8dc8c9d3ad63ecba27843a53174a767254ae55b67416d720ece6fd223b4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
