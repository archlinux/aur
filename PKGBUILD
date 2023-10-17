# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qdapRegex
_pkgver=0.7.8
pkgname=r-${_pkgname,,}
pkgver=0.7.8
pkgrel=1
pkgdesc='Regular Expression Removal, Extraction, and Replacement Tools'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-stringi
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f473f2f0c917005d6f1ba581bd0347a2b27c966442a15da40569b38c067c1dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
