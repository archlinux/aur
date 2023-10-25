# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CONSTANd
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Data normalization by matrix raking'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-cairo
  r-ggplot2
  r-gridextra
  r-knitr
  r-limma
  r-magick
  r-rmarkdown
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d95083be200baac9f56d8d8f7cba928393cb088a556aee24b4b2a9f6e2d41e60')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
