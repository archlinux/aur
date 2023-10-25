# system requirements: samtools
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqCNA
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Copy number analysis of high-throughput sequencing cancer data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-adehabitatlt
  r-dosnow
  r-glad
  r-seqcna.annot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa16f2493ad9cc9385f9f64f59c27367aa4ea57343e2e043e63e0b29efbb1363')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
