# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qsmooth
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('7860cde9616e7828b0d1f59666718629477eaf32ecf469a98fcaf48aa6d3711d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
