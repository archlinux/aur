# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterSeq
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Clustering of high-throughput sequencing data by identifying co-expression patterns'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayseq
  r-biocgenerics
  r-biocparallel
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8891057ac1ec6d4533b0e9fe0b75f6538392256550b0ddc81cdd3df59593ff8a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
