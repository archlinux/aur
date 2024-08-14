# system requirements: GNU Scientific Library version >= 1.8, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=topicmodels
_pkgver=0.2-17
pkgname=r-${_pkgname,,}
pkgver=0.2.17
pkgrel=1
pkgdesc='Topic Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-modeltools
  r-slam
  r-tm
  gsl
)
optdepends=(
  r-corpus.jss.papers
  r-lattice
  r-lda
  r-oaiharvester
  r-snowballc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3867e15ff5d318307695c1aa196b8fe405ee4cbd4f7574e298d78ef778d5168d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
