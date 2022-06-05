# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calibrate
_pkgver=1.7.7
pkgname=r-${_pkgname,,}
pkgver=1.7.7
pkgrel=4
pkgdesc='Calibration of Scatterplot and Biplot Axes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('713b09b415c954e1ef5216088acd40621b0546c45afbb8c2c6f118ecb5cd6fa6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
