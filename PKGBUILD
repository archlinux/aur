# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cleaver
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Cleavage of Polypeptide Sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-brain
  r-knitr
  r-rmarkdown
  r-testthat
  r-uniprot.ws
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('53417e207e8bb617d31f8385cc68849e8a3c2494e3c31790ac2edbce6c062a64')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
