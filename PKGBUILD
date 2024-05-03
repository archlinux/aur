# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chipenrich.data
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='Companion package to chipenrich'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-readr
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-devtools
  r-go.db
  r-knitr
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-txdb.dmelanogaster.ucsc.dm3.ensgene
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
  r-txdb.drerio.ucsc.danrer10.refgene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.mmusculus.ucsc.mm9.knowngene
  r-txdb.rnorvegicus.ucsc.rn4.ensgene
  r-txdb.rnorvegicus.ucsc.rn5.refgene
  r-txdb.rnorvegicus.ucsc.rn6.refgene
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b71dbb4ba53272382f18c61ec2b3b6d13f8d49adfbf067553cc77af241decce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
