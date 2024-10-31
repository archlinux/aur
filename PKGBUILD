# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=packFinder
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('b7dccacc89681ee8cb39677ad085a1c4984e5b010b790a13ce7208f513418352')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
