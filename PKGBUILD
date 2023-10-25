# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MVCClass
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
pkgrel=1
pkgdesc='Model-View-Controller (MVC) Classes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5d5d37965e01b685cb666a0e487723ed685faebb70862d70e9c62684cdb5d199')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
