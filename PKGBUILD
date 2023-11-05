# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=omicRexposome
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=1.24.1
pkgrel=1
pkgdesc='Exposome and omic data associatin and integration analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-isva
  r-limma
  r-multidataset
  r-omicade4
  r-pma
  r-rexposome
  r-smartsva
  r-stringr
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-brgedata
  r-knitr
  r-rmarkdown
  r-snpstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b06e471b498f85c8eab31b9ea1da11e8a0e50262eb8eea9b633739e126ef19db')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
