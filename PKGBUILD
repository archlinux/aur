# system requirements: mono-runtime 4.x or higher (including System.Datalibrary) on Linux/macOS, .Net Framework (>= 4.5.1) on MicrosoftWindows.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MsBackendRawFileReader
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
  r-msbackendmgf
  r-mzr
  r-protviz
  r-rmarkdown
  r-tartare
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('360785e070a8302e61d3dd2344f9f10017cad34d6aa950b8d31389bf2d5cb69f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
