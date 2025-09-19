# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xcms
_pkgver=4.6.4
pkgname=r-${_pkgname,,}
pkgver=4.6.4
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
  r-msexperiment
  r-msfeatures
  r-msnbase
  r-multtest
  r-mzr
  r-plyr
  r-progress
  r-protgenerics
  r-rann
  r-rcolorbrewer
  r-robustbase
  r-s4vectors
  r-spectra
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-catools
  r-faahko
  r-knitr
  r-maldiquant
  r-metabocoreutils
  r-msbackendmgf
  r-msdata
  r-ncdf4
  r-pander
  r-pheatmap
  r-rgl
  r-rgraphviz
  r-rmarkdown
  r-signal
  r-testthat
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('52e82db1883cabc38bea922466276848b40f6be874636a63a1b1a77ce3c226c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
