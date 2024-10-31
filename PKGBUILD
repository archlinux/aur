# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SynMut
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='SynMut: Designing Synonymously Mutated Sequences with Different Genomic Signatures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-seqinr
  r-stringr
)
optdepends=(
  r-biocmanager
  r-devtools
  r-glue
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e5bcd1fe975636cc8f29e7cb7c0aa50c981d74b8e13d73f80b39437fefda8c13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
