# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcade
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=1.37.0
pkgrel=1
pkgdesc='R-based analysis of ChIP-seq And Differential Expression - a tool for integrating a count-based ChIP-seq analysis with differential expression summary data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayseq
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-plotrix
  r-rgl
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biomart
  r-limma
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cfb9bddc3c970dc174a5eb2f5eb126aa0b9968408747cee96fa4ada1d5240af5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
