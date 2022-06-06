# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lfda
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=1.1.3
pkgrel=4
pkgdesc='Local Fisher Discriminant Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-plyr
  r-rarpack
)
optdepends=(
  r-rgl
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('636380e538f8fa41041fd4312bc6c3edf29b1ecd87bb0b3f171a32d26502646a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
