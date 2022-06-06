# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TOAST
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Tools for the analysis of heterogeneous tissues'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
  r-epidish
  r-limma
  r-nnls
  r-reffreeewas
  r-summarizedexperiment
  r-doparallel
  r-ggplot2
  r-tidyr
  r-ggally
)
optdepends=(
  r-biocstyle
  r-cssam
  r-gplots
  r-knitr
  r-matrix
  r-matrixstats
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('924e79d6ac4eb53f4443a12eb13310dc71fc2a635c23e2693243880fa6783fd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
