# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSVGTipsDevice
_pkgver=1.0-7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=4
pkgdesc='An R SVG Graphics Device with Dynamic Tips and Hyperlinks'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://github.com/cran/${_pkgname}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('7a32f363b53289da992b4660031c008231b3990e1789cdc85ab47f3c786d1c54')

build() {
  R CMD INSTALL ${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
