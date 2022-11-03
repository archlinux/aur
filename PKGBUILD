# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SynExtend
_pkgver=1.9.19
pkgname=r-${_pkgname,,}
pkgver=1.9.19
pkgrel=1
pkgdesc='Tools for Working With Synteny Objects'
arch=('any')
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
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44d9025c13bc136894cb06b26825b4dff1ab430110433e55139ba18170868334')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
