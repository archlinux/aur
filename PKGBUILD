# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=Rpdb
_pkgver=2.4.5
pkgname=r-${_pkgname,,}
pkgver=2.4.5
pkgrel=1
pkgdesc='Read, Write, Visualize and Manipulate PDB Files'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8c6048375e37d7de3000e15492b0b17e4d8a5f8c120e6c86087a88f1aa62125f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
