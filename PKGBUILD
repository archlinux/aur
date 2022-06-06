# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hgu133a.db
_pkgver=3.13.0
pkgname=r-${_pkgname,,}
pkgver=3.13.0
pkgrel=4
pkgdesc='Affymetrix Affymetrix HG-U133A Array annotation data (chip hgu133a)'
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
sha256sums=('945e21ba79483ef0d022855978b3e46a3cf8f2b27eeb0e93a6c104ed6c7c4c02')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
