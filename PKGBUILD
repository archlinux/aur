# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dmrseq
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
  r-org.hs.eg.db
  r-rmarkdown
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('42252a80b9873661539188ed80a84931fe66e41455bcc1fdb17ee6880bdca37c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
