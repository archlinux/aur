# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mzR
_pkgver=2.34.1
pkgname=r-${_pkgname,,}
pkgver=2.34.1
pkgrel=1
pkgdesc='parser for netCDF, mzXML, mzData and mzML and mzIdentML files (mass spectrometry data)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-ncdf4
  r-protgenerics
  r-rcpp
  r-rhdf5lib
)
makedepends=(
  gcc
  make
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msdata
  r-mzid
  r-rmarkdown
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13caa6d56b35708683667587d506b3e515b3b6ba14732ece7b015ecf3b5156cb')
options=(!lto !buildflags staticlibs)
build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
