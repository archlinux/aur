# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=groHMM
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='GRO-seq Analysis Pipeline'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-edger
  r-genomicfeatures
  r-org.hs.eg.db
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7813bef49b4dc17e92365affafc60f81594f1337808b6b5dbf1eef23ef6a2b96')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
