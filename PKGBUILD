# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=branchpointer
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Prediction of intronic splicing branchpoints'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biomart
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg38
  r-caret
  r-cowplot
  r-data.table
  r-gbm
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-kernlab
  r-plyr
  r-rtracklayer
  r-s4vectors
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('737c4c9b0b15398d76c07c258a764f1ff455e3239faa56b6adce4f686d4a9b80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
