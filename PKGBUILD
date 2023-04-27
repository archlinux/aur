# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rTRMui
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='A shiny user interface for rTRM'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-motifdb
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rtrm
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab335ac1ff72d13c5806f8bd33def64c6d2ddb7167f7f25c4111326187e49cab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
