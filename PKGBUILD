# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=panelcn.mops
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('636b02dbf69cb78b8cec3808f342451edb92cbf9649ef5df3c6089599c4836bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
