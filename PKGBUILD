# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVSeq
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Remove Unwanted Variation from RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-edaseq
  r-edger
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-knitr
  r-rcolorbrewer
  r-zebrafishrnaseq
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd517f6e363b0f853c70cfa3297580832cc8dc77bde61304355e5b95b99c2145')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
