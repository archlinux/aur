# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gtrellis
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Genome Level Trellis Layout'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-circlize
  r-genomicranges
  r-getoptlong
  r-iranges
)
optdepends=(
  r-cairo
  r-complexheatmap
  r-jpeg
  r-knitr
  r-markdown
  r-png
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tiff
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('58a0ccbddd6eb554c8b76d30098a7dca279faf8d6b518933c42671d6e5959ae2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
