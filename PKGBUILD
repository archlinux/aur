# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=alpine
_pkgver=1.25.0
pkgname=r-${_pkgname,,}
pkgver=1.25.0
pkgrel=1
pkgdesc='alpine'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-iranges
  r-rbgl
  r-rsamtools
  r-s4vectors
  r-speedglm
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-alpinedata
  r-bsgenome.hsapiens.ncbi.grch38
  r-ensembldb
  r-knitr
  r-markdown
  r-rcolorbrewer
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5948b0fccc3f73dc5ab1b61df3c81e44b812fd7506ef5401768050c9f031c407')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
