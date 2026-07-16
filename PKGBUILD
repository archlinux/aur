# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEScan2
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Differential Enrichment Scan 2'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-chippeakanno
  r-data.table
  r-delayedarray
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-glue
  r-iranges
  r-plyr
  r-rcpp
  r-rcpparmadillo
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-edaseq
  r-edger
  r-knitr
  r-limma
  r-rcolorbrewer
  r-rmarkdown
  r-ruvseq
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4e1cca90e393e11dc88692d221f82444e80d94e8afc9743461c2e9323d296801')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
