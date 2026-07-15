# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=packFinder
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='de novo Annotation of Pack-TYPE Transposable Elements'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biostrings
  r-genomicranges
  r-iranges
  r-kmer
  r-s4vectors
)
optdepends=(
  r-bioccheck
  r-biocstyle
  r-biocviews
  r-biomartr
  r-dendextend
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3ce4c4165da3af6c587fa3d391bfd224268e4548b47b5ea53e6348fc4a86456d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
