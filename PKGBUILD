# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BUSpaRse
_pkgver=1.12.2
pkgname=r-${_pkgname,,}
pkgver=1.12.2
pkgrel=1
pkgdesc='kallisto | bustools R utilities'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-annotationdbi
  r-annotationfilter
  r-bh
  r-biocgenerics
  r-biomart
  r-biostrings
  r-bsgenome
  r-dplyr
  r-ensembldb
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-plyranges
  r-rcpp
  r-rcpparmadillo
  r-rcppprogress
  r-s4vectors
  r-stringr
  r-tibble
  r-tidyr
  r-zeallot
  make
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-ensdb.hsapiens.v86
  r-knitr
  r-rmarkdown
  r-tenxbusdata
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f93a73aa8d37953f251ed74a00f66e0c68944c7478c03cd0d9cd2b786198297')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
