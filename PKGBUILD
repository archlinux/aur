# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tofsims
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=3
pkgdesc='Import, process and analysis of Time-of-Flight Secondary Ion Mass Spectrometry (ToF-SIMS) imaging data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-als
  r-alsace
  r-protgenerics
  r-rcpp
  r-rcpparmadillo
  r-signal
)
optdepends=(
  r-biocparallel
  r-ebimage
  r-knitr
  r-parallel
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tofsimsdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5fc9186e49526545d00ed4d461715f5e280da267f7c747d1028b3c507414435')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
