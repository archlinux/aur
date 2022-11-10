# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MALDIquant
_pkgver=1.22
pkgname=r-${_pkgname,,}
pkgver=1.22
pkgrel=1
pkgdesc='Quantitative Analysis of Mass Spectrometry Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b01a2e05f3bcccc426d8175b289255a8c2976ea8ab0e20eec18d442d2c9d015')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
