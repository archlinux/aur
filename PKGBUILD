# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=roar
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Identify differential APA usage from RNA-seq alignments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-rnaseqdata.hnrnpc.bam.chr14
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b94dc3af199b1ffc6377d7cacaf3316f51b3496ab7a4657b067551dcbe992b5e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
