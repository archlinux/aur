# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTopper
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='This package is designed to perform Gene Set Analysis across multiple genomic platforms'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-limma
  r-multtest
)
optdepends=(
  r-go.db
  r-keggrest
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9beb3e53b14425b19271f7f4e8d513dade53bf62da8560372df402c3c6ed804a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
