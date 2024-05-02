# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNAtap
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='miRNAtap: microRNA Targets - Aggregated Predictions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dbi
  r-plyr
  r-rsqlite
  r-sqldf
  r-stringr
)
optdepends=(
  r-mirnatap.db
  r-org.hs.eg.db
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dd5fc62492067231da56f30545feda7a4bf52cb1a6bb10722fbc4598e0704e1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
