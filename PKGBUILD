# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PrInCE
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Predicting Interactomes from Co-Elution'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-dplyr
  r-forecast
  r-hmisc
  r-liblinear
  r-magrittr
  r-msnbase
  r-naivebayes
  r-progress
  r-purrr
  r-ranger
  r-rdpack
  r-robustbase
  r-speedglm
  r-tester
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('124a5a4cafb0a0ac52f87841d2761f0c67d5d59edc3d96c6213f92bdfe8b7613')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
