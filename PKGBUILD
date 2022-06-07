# system requirements: Java (>= 1.7)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSGFplus
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=3
pkgdesc='An interface between R and MS-GF+'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/MSGFplus.html"
license=('GPL')
depends=(
  r
  r-mzid
  r-protgenerics
  java-runtime-headless
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('feac6d5fc46a4d111502da37849b3d9990c46eee1d7e841a948fcc9708a818cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
