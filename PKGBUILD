# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridSVG
_pkgver=1.7-4
pkgname=r-${_pkgname,,}
pkgver=1.7.4
pkgrel=3
pkgdesc="Export 'grid' Graphics as SVG"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-jsonlite
  r-xml
)
optdepends=(
  r-lattice
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b97666e38633960eef04e4c1d0d1be7c8209eabf16250d214a7d666f8a9557cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
