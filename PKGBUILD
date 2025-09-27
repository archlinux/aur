# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqArray
_pkgver=1.48.3
pkgname=r-${_pkgname,,}
pkgver=1.48.3
pkgrel=1
pkgdesc='Data management of large-scale whole-genome sequence variant calls'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL-3.0-only')
depends=(
  r-biostrings
  r-gdsfmt
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
  r-digest
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-crayon
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
sha256sums=('f1452a61e53dd4ce2e91c261066f705d50b0872f658965878df2a35c27d45ac9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
