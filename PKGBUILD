# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=lmom
_pkgver=2.9
pkgname=r-${_pkgname,,}
pkgver=2.9
pkgrel=7
pkgdesc='L-Moments'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('363e62751a73e0870fd0206206f1743a884a23aeac9b31b9afc71c0a1b51bb90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
