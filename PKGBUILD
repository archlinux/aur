# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=panelcn.mops
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='CNV detection tool for targeted NGS panel data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-cn.mops
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b80f8300e251ed2f79af0a0cb11e8db5cfc4dc2a1f50d0e88edcb6f4fa1ddc37')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
