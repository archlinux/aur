# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASICS
_pkgver=2.18.1
pkgname=r-${_pkgname,,}
pkgver=2.18.1
pkgrel=1
pkgdesc='Automatic Statistical Identification in Complex Spectra'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-ggplot2
  r-glmnet
  r-gridextra
  r-mvtnorm
  r-pepsnmr
  r-plyr
  r-quadprog
  r-ropls
  r-summarizedexperiment
  r-zoo
)
optdepends=(
  r-asicsdata
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab6b01a6ae684f7ea8335b59c5197706f3519bd0ea23c95075d550209e36316a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
