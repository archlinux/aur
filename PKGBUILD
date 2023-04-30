# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PrInCE
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
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
sha256sums=('e12fab9c6fe0c3dbda58bb8bd2a51bab1fd0a3834d424202e229dda58c5c64b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
