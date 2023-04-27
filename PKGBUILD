# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sagenhaft
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
pkgrel=1
pkgdesc='Collection of functions for reading and comparing SAGE libraries'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('215d268bf5064aa8fc35be5755caab1ac8a8dbbceb43533bae31a30472f2000b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
