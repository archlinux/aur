# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiSeq
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Processing and analyzing bisulfite sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-betareg
  r-biobase
  r-biocgenerics
  r-formula
  r-genomeinfodb
  r-genomicranges
  r-globaltest
  r-iranges
  r-lokern
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5509927db97bbb8ed237fcdd576c698b7d2e547b9c6c40880bec0a4214f08f8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
