# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SynExtend
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
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
sha256sums=('43f45189cffcc396d59f23ae3b519095dbe8fa303f7b6d8f2c39e5f58e3d7d3c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
