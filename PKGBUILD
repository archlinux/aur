# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SingleCellExperiment
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
pkgrel=1
pkgdesc='S4 Classes for Single Cell Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-genomicranges
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-matrix
  r-rmarkdown
  r-rtsne
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('731003da51b0cff506a4bbfc672c8f2ce5bc6d4c74106b13d9a092ebedf4d371')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
