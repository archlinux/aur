# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wavClusteR
_pkgver=2.38.0
pkgname=r-${_pkgname,,}
pkgver=2.38.0
pkgrel=1
pkgdesc='Sensitive and highly resolved identification of RNA-protein interaction sites in PAR-CLIP data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-foreach
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-hmisc
  r-iranges
  r-mclust
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-seqinr
  r-stringr
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-domc
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb4d8dedd9e970d13d402cf07b4c670acf93aa43ba4d80cbeba308dd9593247b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
