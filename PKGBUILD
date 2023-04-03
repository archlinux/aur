# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dmrseq
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=1.18.1
pkgrel=1
pkgdesc='Detection and inference of differentially methylated regions from Whole Genome Bisulfite Sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationhub
  r-annotatr
  r-biocparallel
  r-bsseq
  r-bumphunter
  r-delayedmatrixstats
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-locfit
  r-matrixstats
  r-outliers
  r-rcolorbrewer
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8508fe6a050fb04b3a4a61a561ae1c4e72323f7f82376e12e19ec9df41164d36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
