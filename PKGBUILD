# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Repitools
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Epigenomic tools'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-dnacopy
  r-edger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-gplots
  r-gsmoothr
  r-iranges
  r-ringo
  r-rsamtools
  r-rsolnp
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg18
  r-shortread
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d997f4b1299e429f987454a22ac04442fac1cb34dd7a9d18dade9e2d644b795d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
