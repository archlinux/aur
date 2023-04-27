# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterStab
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
pkgrel=1
pkgdesc='Compute cluster stability scores for microarray data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
)
optdepends=(
  r-fibroeset
  r-genefilter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f343db1d5319cf9ff6185c1bc9893656663fa19bba6e06868f5932119d24bd46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
