# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=textstem
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=0.1.4
pkgrel=3
pkgdesc='Tools for Stemming and Lemmatizing Text'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-hunspell
  r-korpus
  r-korpus.lang.en
  r-lexicon
  r-quanteda
  r-snowballc
  r-stringi
  r-textclean
  r-textshape
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82d7fed3f701bf191d4c921209365b698bf643717174d1a3de26f0a1628970dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
