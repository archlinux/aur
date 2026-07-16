# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qsmooth
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Smooth quantile normalization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-hmisc
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-bodymaprat
  r-knitr
  r-quantro
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66d2923e95c6e54c14bbe95e9706a1766041df9b4e33f3bf7e0a850485e16b10')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
