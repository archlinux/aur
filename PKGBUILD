# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mumosa
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Multi-Modal Single-Cell Analysis Methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-batchelor
  r-beachmat
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-igraph
  r-iranges
  r-metapod
  r-s4vectors
  r-scaledmatrix
  r-scran
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-uwot
)
optdepends=(
  r-biocstyle
  r-bluster
  r-dropletutils
  r-knitr
  r-rmarkdown
  r-scater
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb51a8233aac14fcfad80b69550ea265695090186f25feb600cd07489177b0d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
