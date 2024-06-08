# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChAMP
_pkgver=2.34.0
pkgname=r-${_pkgname,,}
pkgver=2.34.0
pkgrel=1
pkgdesc='Chip Analysis Methylation Pipeline for Illumina HumanMethylation450 and EPIC'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bumphunter
  r-champdata
  r-combinat
  r-dendextend
  r-dmrcate
  r-dnacopy
  r-doparallel
  r-dt
  r-genomicranges
  r-ggplot2
  r-globaltest
  r-goseq
  r-hmisc
  r-illumina450probevariants.db
  r-illuminahumanmethylation450kmanifest
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-illuminahumanmethylationepicmanifest
  r-illuminaio
  r-impute
  r-isva
  r-kpmt
  r-limma
  r-marray
  r-matrixstats
  r-minfi
  r-missmethyl
  r-plotly
  r-plyr
  r-preprocesscore
  r-prettydoc
  r-quadprog
  r-qvalue
  r-rcolorbrewer
  r-rmarkdown
  r-rpmm
  r-shiny
  r-shinythemes
  r-sva
  r-watermelon
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fbb0ac0878577a5a31954aec2621b4b6f0b6455492b370323e77d5057d1a051b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
