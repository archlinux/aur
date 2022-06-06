# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntEREst
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Intron-Exon Retention Estimator'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dbi
  r-deseq2
  r-dexseq
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rmysql
  r-rsamtools
  r-s4vectors
  r-seqinr
  r-seqlogo
  r-summarizedexperiment
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-clinfun
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4347f64ffec062d4a7100b7849fd441ad47a7d0a4eb4bc2ac3ff14a3b6a83683')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
