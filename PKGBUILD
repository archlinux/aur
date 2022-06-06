# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fishpond
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Fishpond: differential transcript and gene expression with inferential replicates'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-gtools
  r-jsonlite
  r-matrixstats
  r-qvalue
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-svmisc
  gcc
)
optdepends=(
  r-apeglm
  r-deseq2
  r-knitr
  r-limma
  r-macrophage
  r-org.hs.eg.db
  r-rmarkdown
  r-samr
  r-testthat
  r-tximeta
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d56738efeffcf66485d7a28d2b9b82ecfbd4da872cbfe0fb5a1f660da027776b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
