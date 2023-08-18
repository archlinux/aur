# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emdist
_pkgver=0.3-3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=1
pkgdesc="Earth Mover's Distance"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b78e0c5dd49259f4389682b34fa2ebeb03b798a41183f9c31d4dc92b82f9b64a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
