# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hgu133a2.db
_pkgver=3.13.0
pkgname=r-${_pkgname,,}
pkgver=3.13.0
pkgrel=4
pkgdesc='Affymetrix Affymetrix HG-U133A_2 Array annotation data (chip hgu133a2)'
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
sha256sums=('1a6f84ab9d62e0aae4f6573f99d388230b77ca07eeb26eaab59f54c7a171b272')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
