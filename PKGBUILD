# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=MsExperiment
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Infrastructure for Mass Spectrometry Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-iranges
  r-protgenerics
  r-qfeatures
  r-s4vectors
  r-spectra
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msdata
  r-mzr
  r-rmarkdown
  r-roxygen2
  r-rpx
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf79cbb2db2cd679285cdd5407a46bbf8f816804f736f375c5b20ff88189a01a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
