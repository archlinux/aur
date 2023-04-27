# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SynExtend
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Tools for Working With Synteny Objects'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-decipher
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6c2857b8f69cb2903f6359900865a7c4844ce06fb11cadefb23fd40d986ddd1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
