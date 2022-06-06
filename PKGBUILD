# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LRBaseDbi
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
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
sha256sums=('f9508377656c61c908512d158f3ea4cadd08d710c3f1b69bcf5469a1c56d070e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
