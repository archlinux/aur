# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xcms
_pkgver=4.10.1
pkgname=r-${_pkgname,,}
pkgver=4.10.1
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
  r-data.table
  r-iranges
  r-massspecwavelet
  r-metabocoreutils
  r-mscoreutils
  r-msexperiment
  r-msfeatures
  r-msnbase
  r-mzr
  r-progress
  r-protgenerics
  r-rcolorbrewer
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
  r-msbackendmgf
  r-msdatahub
  r-multtest
  r-ncdf4
  r-pander
  r-pheatmap
  r-rann
  r-rhdf5
  r-rmarkdown
  r-signal
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc2ae5ea496fcc425757b262f36379c729be26ef100fc26ca5cfde41d172d0f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
