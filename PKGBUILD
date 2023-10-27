# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NADfinder
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Call wide peaks for sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-atacseqqc
  r-baseline
  r-biocgenerics
  r-corrplot
  r-csaw
  r-empiricalbrownsmethod
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-limma
  r-metap
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-signal
  r-summarizedexperiment
  r-trackviewer
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-rmarkdown
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8f71e6e168bc500b9d8af3a49b0183edb6f04904b8dd6e5036b70ce0c3ee2c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
