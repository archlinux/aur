# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Harman
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='The removal of batch effects from datasets using a PCA and constrained optimisation based technique'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-matrixstats
  r-ckmeans.1d.dp
)
optdepends=(
  r-affydata
  r-biocgenerics
  r-biocstyle
  r-bladderbatch
  r-harmandata
  r-knitr
  r-limma
  r-lumi
  r-minfi
  r-minfidata
  r-msmseda
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-sva
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3750c9d1dff99a6e1bc89b0718f3f5116114e2598e06498744164f3c6b57d9cd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
