# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqArray
_pkgver=1.42.3
pkgname=r-${_pkgname,,}
pkgver=1.42.3
pkgrel=1
pkgdesc='Data management of large-scale whole-genome sequence variant calls'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-gdsfmt
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-crayon
  r-digest
  r-knitr
  r-markdown
  r-rcpp
  r-rmarkdown
  r-rsamtools
  r-runit
  r-snprelate
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66d293573d7eda7e960d62479b211dff42089828022c27ae53aaf5f634df0094')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
