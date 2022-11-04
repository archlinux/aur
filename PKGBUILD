# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tofsims
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=4
pkgdesc='Import, process and analysis of Time-of-Flight Secondary Ion Mass Spectrometry (ToF-SIMS) imaging data'
arch=('x86_64')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
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
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
