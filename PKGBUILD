# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sylly
_pkgver=0.1-6
pkgname=r-${_pkgname,,}
pkgver=0.1.6
pkgrel=4
pkgdesc='Hyphenation and Syllable Counting for Text Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sylly.de
  r-sylly.en
  r-sylly.es
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5d601178384ac24c4bca752690ea30b0901673e4b92e449a87eba125a9a0338')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
