# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phylolm
_pkgver=2.6.2
pkgname=r-${_pkgname,,}
pkgver=2.6.2
pkgrel=1
pkgdesc='Phylogenetic Linear Regression'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-future.apply
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6fa45f58689cce9fe91519ab55a61c1e549e5a7f18b6989bf86234d483cff12')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
