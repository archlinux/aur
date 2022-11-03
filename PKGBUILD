# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMCFB
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Differentially Methylated Cytosines via a Bayesian Functional Approach'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-arm
  r-benchmarkme
  r-biocparallel
  r-data.table
  r-fastdummies
  r-genomicranges
  r-iranges
  r-matrixstats
  r-rtracklayer
  r-s4vectors
  r-speedglm
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('998fdd9b5812b0f127b30d95ea0776bb9ad1dc9ff7ca6ec4901b9c9e9d304302')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
