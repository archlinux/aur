# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fishpond
_pkgver=2.6.1
pkgname=r-${_pkgname,,}
pkgver=2.6.1
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
sha256sums=('dce998e52b641a28d4c6f812794aaeeb19f24b7cf77f7d5859e92885bf858d06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
