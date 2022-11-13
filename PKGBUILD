# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TIN
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=3
pkgdesc='Transcriptome instability analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aroma.affymetrix
  r-data.table
  r-impute
  r-squash
  r-stringr
  r-wgcna
)
optdepends=(
  r-affxparser
  r-aroma.light
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('28c2f9ebeaf0cfb537ea6d5f4cd7cc495d3d487471057e52042df5e00b889705')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
