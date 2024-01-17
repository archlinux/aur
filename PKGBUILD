# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=harmonicmeanp
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
pkgdesc='Harmonic Mean p-Values and Model Averaging by Mean Maximum Likelihood'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fmstable
)
optdepends=(
  r-ape
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f5c58b2171955d79074ca15b2d3eee1eb41c26a19eb6b64220b46ca9c8a9d86')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
