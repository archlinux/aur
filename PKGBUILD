# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioDist
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Different distance measures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
)
optdepends=(
  r-locfit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bf2b9c5d478f2845cb73c23bb1c4a0f0070fbb6c6d20cc36274ff18496f6f759')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
