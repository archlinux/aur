# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellScore
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('08614f259e1062058af11cf4c70431e0584530982230666c8f5a11ed6cbd5a9d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
