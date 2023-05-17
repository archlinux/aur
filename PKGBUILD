# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scattermore
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=1
pkgdesc='Scatterplots with More Points'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-scales
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('63e9c0b80a3a1643b8a16c067e0e1144055c8bee5b15370c3266868982cf51c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
