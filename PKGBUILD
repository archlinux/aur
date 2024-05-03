# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vulcan
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='VirtUaL ChIP-Seq data Analysis using Networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-catools
  r-chippeakanno
  r-csaw
  r-deseq2
  r-diffbind
  r-genomicranges
  r-gplots
  r-locfit
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-viper
  r-wordcloud
  r-zoo
)
optdepends=(
  r-vulcandata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca7549d97864beb922be564d9becd081193fc64e44474367f0dcf0bc329135ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
