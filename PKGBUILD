# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PrInCE
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('c4a255a07a789844cb009817fee2b56470280b9578277334e980a8c59e9e90d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
