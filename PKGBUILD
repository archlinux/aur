# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bayNorm
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Single-cell RNA sequencing data normalization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bb
  r-biocparallel
  r-dosnow
  r-fitdistrplus
  r-foreach
  r-iterators
  r-locfit
  r-rcpp
  r-rcpparmadillo
  r-rcppprogress
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d8c553aca41a9b23a5e5a9b1973f7e73b717b28633e2dc7472a30fd203279b06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
