# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scattermore
_pkgver=0.8
pkgname=r-${_pkgname,,}
pkgver=0.8
pkgrel=3
pkgdesc='Scatterplots with More Points'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-scales
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dbdd73d8261cb063464bb29d5c17733b7e87bc50a19948bc80439e19f2a9f8e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
