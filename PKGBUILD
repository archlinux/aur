# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limmaGUI
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=1.90.0
pkgrel=1
pkgdesc='GUI for limma Package With Two Color Microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-r2html
  r-tkrplot
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89e0f06cf8f8e614851a310273a8cc632c48fca8cbb29e312bdd798a6e888f3d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
