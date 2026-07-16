# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligoClasses
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Classes for high-throughput arrays supported by oligo and crlmm'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affyio
  r-biobase
  r-biocgenerics
  r-biocmanager
  r-biostrings
  r-dbi
  r-ff
  r-foreach
  r-genomicranges
  r-iranges
  r-rsqlite
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-crlmm
  r-domc
  r-dompi
  r-doparallel
  r-doredis
  r-dosnow
  r-genomewidesnp5crlmm
  r-genomewidesnp6crlmm
  r-hapmapsnp5
  r-hapmapsnp6
  r-human370v1ccrlmm
  r-pd.genomewidesnp.5
  r-pd.genomewidesnp.6
  r-pd.mapping250k.nsp
  r-pd.mapping250k.sty
  r-pd.mapping50k.hind240
  r-pd.mapping50k.xba240
  r-runit
  r-vanillaice
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7df65de0fc01d6b79973b8c0fe7d46aa8a71fe8b08be4afba498995f5f18d31d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
