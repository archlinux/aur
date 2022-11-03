# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TOAST
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('7ab351bd78cd973ae1c28382c313d1f8dace088e38c7615b338794cbdfd236ed')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
