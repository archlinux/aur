# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.data
_pkgver=2.2-0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=7
pkgdesc="Datasets for 'spatstat' Family"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.utils
)
optdepends=(
  r-spatstat.core
  r-spatstat.geom
  r-spatstat.linnet
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d3943bb4f6509d60bf68e79ce4533c5ec5261f411da6b0ef5238c124fc37c3e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
