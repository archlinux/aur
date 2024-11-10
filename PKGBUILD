# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=podkat
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Position-Dependent Kernel Association Test'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcpp
  r-rhtslib
  r-rsamtools
  make
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg38.masked
  r-bsgenome.mmusculus.ucsc.mm10.masked
  r-gwastools
  r-knitr
  r-summarizedexperiment
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25468258e10c1feac59cb5f0c3a0d7387745368ffc1453efad54220b90e12e93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
