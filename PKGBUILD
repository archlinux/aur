# system requirements: mono-runtime 4.x or higher (including System.Datalibrary) on Linux/macOS, .Net Framework (>= 4.5.1) on MicrosoftWindows.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MsBackendRawFileReader
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Mass Spectrometry Backend for Reading Thermo Fisher Scientific raw Files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-iranges
  r-mscoreutils
  r-rawrr
  r-s4vectors
  r-spectra
  mono
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-knitr
  r-lattice
  r-mzr
  r-protviz
  r-rmarkdown
  r-tartare
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('46c3f593e6ed97cc9fd1a1c520e680ee70e27e5e0ef0b279d27138e68f6c8ffe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
