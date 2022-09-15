# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rGADEM
_pkgver=2.44.1
pkgname=r-${_pkgname,,}
pkgver=2.44.1
pkgrel=1
pkgdesc='de novo motif discovery'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-genomicranges
  r-iranges
  r-seqlogo
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5828fc8f731c00ca338b0428338b1e18e3f3d1bacc9fff65fa6a56bb554c5f14')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
