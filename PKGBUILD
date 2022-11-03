# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qsmooth
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('07589a7641b764a6ba34b3b9a96ea2336e1283f745e7fe960972d5d73cdbfc65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
