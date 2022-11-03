# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=txcutr
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Transcriptome CUTteR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-knitr
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-txdb.scerevisiae.ucsc.saccer3.sgdgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f18360790720453b88570ce68588f0fb9c59e61bacd497fae202bfa0a7d95317')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
