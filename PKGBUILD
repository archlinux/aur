# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miscTools
_pkgver=0.6-26
pkgname=r-${_pkgname,,}
pkgver=0.6.26
pkgrel=4
pkgdesc='Miscellaneous Tools and Utilities'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
)
optdepends=(
  r-ecdat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('be3c5a63ca12ce7ce4d43767a1815cd3dcf32664728ade251cfb03ea6f77fc9a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
