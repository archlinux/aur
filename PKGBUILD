# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqArray
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('3e03fd8dfea39b7482d3d76870d41eb93653afbb5b8f3ce2d42611c82af7d58c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
