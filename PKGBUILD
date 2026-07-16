# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMCFB
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('12de7449c53434ad6bcb87f05fa571e33bcecf6aa2353d72ec8efab8512e4c23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
