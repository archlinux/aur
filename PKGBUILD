# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maxLik
_pkgver=1.5-2
pkgname=r-${_pkgname,,}
pkgver=1.5.2
pkgrel=4
pkgdesc='Maximum Likelihood Estimation and Related Tools'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-generics
  r-misctools
  r-sandwich
)
optdepends=(
  r-clue
  r-dlm
  r-mass
  r-plot3d
  r-tibble
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7cee05be0624b6a76911fa7b0d66f3e1b78460e0c55ed8bc904ce1e8af7bb15d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
