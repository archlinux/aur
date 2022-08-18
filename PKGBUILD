# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=aTSA
_pkgver=3.1.2
pkgname=r-${_pkgname,,}
pkgver=3.1.2
pkgrel=2
pkgdesc='Alternative Time Series Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a43cf1a68520d3992dce76c1c069be067162bc13d35cb4264440760db4ba7adc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
