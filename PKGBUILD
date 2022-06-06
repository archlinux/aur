# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hgu95a.db
_pkgver=3.13.0
pkgname=r-${_pkgname,,}
pkgver=3.13.0
pkgrel=4
pkgdesc='Affymetrix Affymetrix HG_U95A Array annotation data (chip hgu95a)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-org.hs.eg.db
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0a6648a6088eba9b955d8cdbd24c52309f8f34e8e2789cb7246b3b3c0bb535cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
