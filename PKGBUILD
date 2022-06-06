# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ismev
_pkgver=1.42
pkgname=r-${_pkgname,,}
pkgver=1.42
pkgrel=4
pkgdesc='An Introduction to Statistical Modeling of Extreme Values'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0d57fbeca83bd478e84fcff795967d51d8448c629abe7adc6c4c18c7fb8bf1a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
