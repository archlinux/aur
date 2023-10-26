# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CINdex
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Chromosome Instability Index'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bitops
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-gplots
  r-gridextra
  r-iranges
  r-png
  r-s4vectors
  r-som
  r-stringr
)
optdepends=(
  r-annotationhub
  r-biocgenerics
  r-biostrings
  r-biovizbase
  r-homo.sapiens
  r-knitr
  r-methods
  r-org.hs.eg.db
  r-pd.genomewidesnp.6
  r-r.utils
  r-reactomepa
  r-rtracklayer
  r-runit
  r-testthat
  r-txdb.hsapiens.ucsc.hg18.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('778b5d2346f9c4b140abbe331322cc4cccd9c9c6406ae3950bf29b117c85e295')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
