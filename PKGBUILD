# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=igvR
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='igvR: integrative genomics viewer'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-browserviz
  r-genomicalignments
  r-genomicranges
  r-httpuv
  r-httr
  r-rcolorbrewer
  r-rtracklayer
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-motifdb
  r-rmarkdown
  r-runit
  r-seqlogo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41d93b3193c07294619e0f3b822ddf343fad7627e9daecf5cce8fd20ffd07766')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
