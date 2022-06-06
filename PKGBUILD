# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emdist
_pkgver=0.3-2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
pkgrel=3
pkgdesc="Earth Mover's Distance"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d09a7b22e280466366838f18cab3acb82d12d6a42bfa3f13ae6095506137bb16')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
