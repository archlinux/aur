# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=2.4-0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=3
pkgdesc="Geometrical Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-deldir
  r-polyclip
  r-spatstat.data
  r-spatstat.utils
)
optdepends=(
  r-fftwtools
  r-maptools
  r-spatial
  r-spatstat
  r-spatstat.core
  r-spatstat.linnet
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('32b89a409ce87ffe901e4c8720a26cac9629f9816e163c4ad68b7aa012d69e67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
