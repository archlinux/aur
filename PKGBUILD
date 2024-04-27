# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=alpine
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=3
pkgdesc='alpine'
arch=('any')
url="https://bioconductor.org/packages/3.17/${_pkgname}"
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6be1cbe591d858f1e70bf3bb64718c3b7f12bdd4561e28da71fdd66069aaa4d5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
