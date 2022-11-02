# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rSWeeP
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Functions to creation of low dimensional comparative matrices of Amino Acid Sequence occurrences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-pracma
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-methods
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a2c230ae0400eee7b6d2d4aa6345f77215561d6d5dadee2adf924705afc3269b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
