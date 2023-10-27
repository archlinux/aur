# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ramwas
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Fast Methylome-Wide Association Study Pipeline for Enrichment Platforms'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-biomart
  r-biostrings
  r-digest
  r-filematrix
  r-genomicalignments
  r-glmnet
  r-rsamtools
)
optdepends=(
  r-biocstyle
  r-bsgenome.ecoli.ncbi.20080805
  r-knitr
  r-pander
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b42c49acc8c02c73d12719aa4eb89dc23ea669e95edcfa80320ca48068d8d5a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
