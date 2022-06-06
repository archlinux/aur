# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=textclean
_pkgver=0.9.3
pkgname=r-${_pkgname,,}
pkgver=0.9.3
pkgrel=4
pkgdesc='Text Cleaning Tools'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-english
  r-glue
  r-lexicon
  r-mgsub
  r-qdapregex
  r-stringi
  r-textshape
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f6f3b0abaa3567a1d29f5457087aad31277f3c1473747989c9804479881f24d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
