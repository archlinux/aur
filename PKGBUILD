# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMRcate
_pkgver=2.99.6
pkgname=r-${_pkgname,,}
pkgver=2.99.6
pkgrel=1
pkgdesc='Methylation array and sequencing spatial analysis methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biomart
  r-bsseq
  r-dss
  r-edger
  r-experimenthub
  r-genomeinfodb
  r-genomicranges
  r-gviz
  r-iranges
  r-limma
  r-minfi
  r-missmethyl
  r-plyr
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-dmrcatedata
  r-flowsorted.blood.epic
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-knitr
  r-runit
  r-tissuetreg
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce1b1991b917eb84633380e0de106216b3bf9da0b66b9629848eba104422d2ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
