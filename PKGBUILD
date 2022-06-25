# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fda
_pkgver=6.0.4
pkgname=r-${_pkgname,,}
pkgver=6.0.4
pkgrel=1
pkgdesc='Functional Data Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-desolve
  r-fds
)
optdepends=(
  r-lattice
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('425ba59bb093becb754bd4d6cedcbcfa1e75a2ccb270c6b7f98f80f4740e4a64')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
