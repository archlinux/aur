# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gmapR
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='An R interface to the GMAP/GSNAP/GSTRUCT suite'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-bsgenome.dmelanogaster.ucsc.dm3
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-lungcancerlines
  r-org.hs.eg.db
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a4170ff62a8a5482a5f77187ec9b3791896546c1eb1038545eb7f90cf488022')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
