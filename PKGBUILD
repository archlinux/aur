# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPanalyser
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='ChIPanalyser: Predicting Transcription Factor Binding Sites'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocmanager
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcolorbrewer
  r-rcpproll
  r-rocr
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-bsgenome.dmelanogaster.ucsc.dm6
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('108ee71a8bd7bdf2693f916e3866e173949e4441abc508a00a9a6f72552fb597')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
