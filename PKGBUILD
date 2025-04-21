# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPloidy
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Analyze flow cytometer data to determine sample ploidy'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-catools
  r-flowcore
  r-knitr
  r-minpack.lm
  r-rmarkdown
  r-shiny
)
optdepends=(
  r-flowploidydata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9defe2a7fd07661bdeee295c214f3bf64cc02fb593882f7c9b38f8353c6584d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
