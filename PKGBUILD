# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clv
_pkgver=0.3-2.2
pkgname=r-${_pkgname,,}
pkgver=0.3.2.2
pkgrel=4
pkgdesc='Cluster Validation Techniques'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0399fbb7040c577b82bcb0583f6950d43a15619803f407aedb274603fbb0521c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
