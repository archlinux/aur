# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=biglm
_pkgver=0.9-2.1
pkgname=r-${_pkgname,,}
pkgver=0.9.2.1
pkgrel=7
pkgdesc='Bounded Memory Linear and Generalized Linear Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dbi
)
optdepends=(
  r-leaps
  r-rodbc
  r-rsqlite
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6dcf3c9e7c3f56cdaac94cc0c427f606880467e1e753fe7ea45c10bc44eec947')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
