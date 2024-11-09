# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IdeoViz
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Plots data (continuous/discrete) along chromosomal ideogram'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcolorbrewer
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c391316508bc006f18c74cb4ad3b8b393776b8b2a0fdc391f9cd3ad353289858')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
