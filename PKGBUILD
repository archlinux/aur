# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PICS
_pkgver=2.42.0
pkgname=r-${_pkgname,,}
pkgver=2.42.0
pkgrel=1
pkgdesc='Probabilistic inference of ChIP-seq'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rsamtools
  gsl
)
optdepends=(
  r-knitr
  r-parallel
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e0d01603ec41a0899f686a6d68392e85f5695054d50e9809e7f4ed329d18d46a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
