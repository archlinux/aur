# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iterClust
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Iterative Clustering'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biobase
)
optdepends=(
  r-bcellviper
  r-tsne
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf36aa1aafeaa328e4c5483bbb88768b30fe8c37483834b34ccd7af20e63504c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
