# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fds
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=2.0
pkgrel=1
pkgdesc='Functional Data Sets'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-httr
  r-rainbow
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('adea1d4e1833009d40ea1ab06457ecb7ddf4dda3d99a11b12b28611b4f5f7d18')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
