# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RApiSerialize
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=1
pkgdesc='R API Serialization'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b7d319069cca964c2da61a50dc3984a974f8a019dfc78ad66af72c58b4e9713e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
