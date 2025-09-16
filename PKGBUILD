# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=Rpdb
_pkgver=2.4.1
pkgname=r-${_pkgname,,}
pkgver=2.4.1
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
sha256sums=('154d69c0751e29abe108079445d1a7eb2bbeb30babd2af0b3b00ba47b3865403')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
