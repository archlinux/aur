# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PrInCE
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('0bac0716c048999ca86d3e2f698d5b1d9ed20368cdf1a90e0a5fe5d1b3e9031f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
