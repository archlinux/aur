# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LRBaseDbi
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
pkgrel=1
pkgdesc='DBI to construct LRBase-related package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-dbi
  r-rsqlite
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('320643cff3ca9796118e4af73abcf410a6076a67cd8dab7b91bf1e67a24a43c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
