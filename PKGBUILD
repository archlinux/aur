# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HGNChelper
_pkgver=0.8.1
pkgname=r-${_pkgname,,}
pkgver=0.8.1
pkgrel=4
pkgdesc='Identify and Correct Invalid HGNC Human Gene Symbols and MGI Mouse Gene Symbols'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa3f0b3a8691ed93d63bec8f36d2954c6fcfd0b8b3efc705379248544c999363')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
