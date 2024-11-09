# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellScore
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Tool for Evaluation of Cell Identity from Transcription Profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-gplots
  r-lsa
  r-rcolorbrewer
  r-squash
  r-summarizedexperiment
)
optdepends=(
  r-hgu133plus2cellscore
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d156c0cd534c1d0524ce7f2368ec19f1b4313a06a3676acc948e8a115ab78b20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
