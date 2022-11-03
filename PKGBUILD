# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCATE
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='SCATE: Single-cell ATAC-seq Signal Extraction and Enhancement'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-genomicalignments
  r-genomicranges
  r-mclust
  r-preprocesscore
  r-rtsne
  r-scatedata
  r-splines2
  r-xgboost
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('505476c3a5e6a2369b0d5ded258f404de2346ad193d74c8bbe329d84018fb4ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
