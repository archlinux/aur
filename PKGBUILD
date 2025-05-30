# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LRBaseDbi
_pkgver=2.18.1
pkgname=r-${_pkgname,,}
pkgver=2.18.1
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
sha256sums=('ea3cc7c661b295f0b3a30856cf0b202fdb6847bbe69a5594877cd898f83eeaf2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
