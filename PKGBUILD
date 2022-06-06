# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ica
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=1.0.2
pkgrel=4
pkgdesc='Independent Component Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e721596fc6175d3270a60d5e0b5b98be103a8fd0dd93ef16680af21fe0b54179')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
