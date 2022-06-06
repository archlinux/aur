# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fingerprint
_pkgver=3.5.7
pkgname=r-${_pkgname,,}
pkgver=3.5.7
pkgrel=4
pkgdesc='Functions to Operate on Binary Fingerprint Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2ca25567efb297e095d010010c4aaa91149dacf8084fa3e20d4367d9fce44c12')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
