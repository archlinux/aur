# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hgu133plus2.db
_pkgver=3.13.0
pkgname=r-${_pkgname,,}
pkgver=3.13.0
pkgrel=4
pkgdesc='Affymetrix Affymetrix HG-U133_Plus_2 Array annotation data (chip hgu133plus2)'
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
sha256sums=('ddde58e777a8341536a664c7d4be874a2f395f8aaa019c1f738462a8ce74cc44')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
