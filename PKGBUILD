# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=som
_pkgver=0.3-5.1
pkgname=r-${_pkgname,,}
pkgver=0.3.5.1
pkgrel=4
pkgdesc='Self-Organizing Map'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a6f4c0e5b36656b7a8ea144b057e3d7642a8b71972da387a7133f3dd65507fb9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
