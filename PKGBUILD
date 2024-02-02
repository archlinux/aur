# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=extRemes
_pkgver=2.1-4
pkgname=r-${_pkgname,,}
pkgver=2.1.4
pkgrel=1
pkgdesc='Extreme Value Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-distillery
  r-lmoments
)
optdepends=(
  r-fields
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cea42cf67e7a2d99451a2a3541bab41c1e64c86b45de37fa0119c49f7083b78a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
