# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethylSeekR
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Segmentation of Bis-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsgenome
  r-geneplotter
  r-genomicranges
  r-iranges
  r-mhsmm
  r-rtracklayer
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a5fdcbc6a41e787839a54c5a293b6031a2876b244f42d2c9b946905f1aa86381')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
