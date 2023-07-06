# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdsfmt
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
pkgrel=1
pkgdesc='R Interface to CoreArray Genomic Data Structure (GDS) Files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-crayon
  r-digest
  r-knitr
  r-markdown
  r-matrix
  r-parallel
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a753d15c43d4d8618f6751b6ec87f1d8439a9eb3a1e2d4c1f2fbdb6fbf581187')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
