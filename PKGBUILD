# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmicCircos
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='High-quality circular visualization of omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('61b1796a75a72c3be8779673532b65b841d439277a7af427ca9ed1d12c85c92f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
