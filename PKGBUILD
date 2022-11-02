# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MantelCorr
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=1.68.0
pkgrel=1
pkgdesc='Compute Mantel Cluster Correlations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa1493248a9b690177e8df20b1b723061edc590e61352fe075ff1ab63ea98234')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
