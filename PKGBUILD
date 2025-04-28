# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=casper
_pkgver=2.42.0
pkgname=r-${_pkgname,,}
pkgver=2.42.0
pkgrel=1
pkgdesc='Characterization of Alternative Splicing based on Paired-End Reads'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-coda
  r-ebarrays
  r-gaga
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-gtools
  r-iranges
  r-limma
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-sqldf
  r-vgam
)
optdepends=(
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41d1fb2dc47469fe19f1ccce7df185fbce7e466e2ddde7c941a394aae853cc0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
