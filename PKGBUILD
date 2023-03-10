# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridSVG
_pkgver=1.7-5
pkgname=r-${_pkgname,,}
pkgver=1.7.5
pkgrel=1
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
sha256sums=('25cf6abaf6ea0abde676edc6f5012139c5c65e068412d2d38876998453b718dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
