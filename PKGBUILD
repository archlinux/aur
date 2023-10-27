# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compEpiTools
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Tools for computational epigenomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-go.db
  r-gplots
  r-iranges
  r-methylpipe
  r-rsamtools
  r-s4vectors
  r-topgo
  r-xvector
)
optdepends=(
  r-bsgenome.mmusculus.ucsc.mm9
  r-knitr
  r-org.mm.eg.db
  r-rtracklayer
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4e24c1334f10851a375f14c10be9ede2e8c0d747e1110803873c93c5f05dbba5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
