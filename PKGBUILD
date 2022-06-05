# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=conicfit
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=1.0.4
pkgrel=4
pkgdesc='Algorithms for Fitting Circles, Ellipses and Conics Based on the Work by Prof. Nikolai Chernov'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-geigen
  r-pracma
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed24be4c32908e77319c64e6dab14718845e107a18566dbbe3ab621f5f27e0b4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
