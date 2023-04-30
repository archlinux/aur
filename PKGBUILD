# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=exomePeak2
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=1
pkgdesc='Bias-aware Peak Calling and Quantification for MeRIP-Seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-deseq2
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-mclust
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-speedglm
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('46a94dcd4fb5106d8c83fa30ed0cf981ed379f1627264b31738fe1c74c93057c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
