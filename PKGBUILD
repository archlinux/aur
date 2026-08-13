# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=normr
_pkgver=1.38.1
pkgname=r-${_pkgname,,}
pkgver=1.38.1
pkgrel=1
pkgdesc='Normalization and difference calling in ChIP-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bamsignals
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-qvalue
  r-rcpp
  r-rtracklayer
  gcc
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('840acf6aee280821c19b84fa296e7712642b0199ce3a46912d075b3b1318cfbd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
