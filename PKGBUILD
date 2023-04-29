# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xcms
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=3.22.0
pkgrel=1
pkgdesc='LC-MS and GC-MS Data Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-iranges
  r-massspecwavelet
  r-mscoreutils
  r-msfeatures
  r-msnbase
  r-multtest
  r-mzr
  r-plyr
  r-protgenerics
  r-rann
  r-rcolorbrewer
  r-robustbase
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-catools
  r-faahko
  r-knitr
  r-magrittr
  r-maldiquant
  r-msbackendmgf
  r-msdata
  r-ncdf4
  r-pander
  r-pheatmap
  r-progress
  r-rgl
  r-rgraphviz
  r-rmarkdown
  r-signal
  r-spectra
  r-testthat
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b48c0bc1a8d79d9eded50ab9365235ca5cdd9921cb3041eca8c1c102f154f84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
