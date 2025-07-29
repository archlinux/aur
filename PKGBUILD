# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RecordLinkage
_pkgver=0.4-12.5
pkgname=r-${_pkgname,,}
pkgver=0.4.12.5
pkgrel=1
pkgdesc='Record Linkage Functions for Linking and Deduplicating Data Sets'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ada
  r-data.table
  r-dbi
  r-e1071
  r-evd
  r-ff
  r-ipred
  r-rsqlite
  r-xtable
)
optdepends=(
  r-knitr
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3db03e2fd8c6a34cc5390065dc1ea30f7b11b505b26f128e14facfeaa7e5b791')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
