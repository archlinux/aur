# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=Rpdb
_pkgver=2.3.4
pkgname=r-${_pkgname,,}
pkgver=2.3.4
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
sha256sums=('058d79f6f1978dea451b53dbcffaa3418f4360ac3c05df6732e6143d9a5fd25a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
