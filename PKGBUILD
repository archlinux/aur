# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=polyester
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Simulate RNA-seq reads'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-iranges
  r-limma
  r-logspline
  r-s4vectors
  r-zlibbioc
)
optdepends=(
  r-ballgown
  r-knitr
  r-markdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bac7b6a80979d604732e3ccc785ceca08fa37760312abf8332f3ce1ba9278a9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
