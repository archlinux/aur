# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fishpond
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Fishpond: differential transcript and gene expression with inferential replicates'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-abind
  r-genomicranges
  r-gtools
  r-iranges
  r-jsonlite
  r-matrixstats
  r-qvalue
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-svmisc
)
optdepends=(
  r-annotationdbi
  r-apeglm
  r-data.table
  r-deseq2
  r-ensdb.hsapiens.v86
  r-ensembldb
  r-genomeinfodb
  r-genomicfeatures
  r-gviz
  r-knitr
  r-limma
  r-macrophage
  r-org.hs.eg.db
  r-pheatmap
  r-rmarkdown
  r-samr
  r-testthat
  r-tximeta
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca1b3e2390d8812f7bf42de7ec2bc6f29019140e8c90158e81eb077c27bd1f1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
