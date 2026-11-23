# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMRcate
_pkgver=3.8.0
pkgname=r-${_pkgname,,}
pkgver=3.8.0
pkgrel=1
pkgdesc='Methylation array and sequencing spatial analysis methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-annotationhub
  r-biomart
  r-bsseq
  r-edger
  r-experimenthub
  r-genomicranges
  r-gviz
  r-iranges
  r-limma
  r-minfi
  r-missmethyl
  r-plyr
  r-s4vectors
  r-seqinfo
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-dmrcatedata
  r-epicv2manifest
  r-flowsorted.blood.epic
  r-genomeinfodb
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-illuminahumanmethylationepicv2anno.20a1.hg38
  r-knitr
  r-runit
  r-tissuetreg
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7dfc8225ff4bdb21563404eb16c442abed4008027fdf5d907c0c22360bd0e949')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
