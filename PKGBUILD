# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SynExtend
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=1.20.2
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
  gcc-fortran
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('532783e5fb10cfaeb559e4d0528f7701e5294983a45705976795d8aa2d2e8461')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
