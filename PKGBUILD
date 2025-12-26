# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sva
_pkgver=3.58.0
pkgname=r-${_pkgname,,}
pkgver=3.58.0
pkgrel=1
pkgdesc='Surrogate Variable Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-edger
  r-genefilter
  r-limma
  r-matrixstats
)
optdepends=(
  r-biocstyle
  r-bladderbatch
  r-pamr
  r-testthat
  r-zebrafishrnaseq
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cfad02a44aa66db2986479d8321b8026ae9e0968d60149b39aa92ee268185260')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
