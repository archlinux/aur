# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DMCFB
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('8a10461247bf3ecdb7588ab398cc3550b9c95f09de2c7c17d1151e2f273eee42')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
