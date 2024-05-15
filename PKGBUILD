# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xcms
_pkgver=4.2.1
pkgname=r-${_pkgname,,}
pkgver=4.2.1
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
sha256sums=('8e68fbffd44b2efad96ad79101ac0aad252319b720e5ae5406418b5352f976e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
