# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snowfall
_pkgver=1.84-6.2
pkgname=r-${_pkgname,,}
pkgver=1.84.6.2
pkgrel=1
pkgdesc='Easier cluster computing (based on snow).'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-snow
)
optdepends=(
  r-rmpi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b467ab2b992455c6e1aeabe375c5694761fa1cf8aaf4f003ca47102b656353b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
