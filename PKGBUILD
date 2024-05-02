# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PADOG
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Pathway Analysis with Down-weighting of Overlapping Genes (PADOG)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-dorng
  r-foreach
  r-gsa
  r-hgu133a.db
  r-hgu133plus2.db
  r-keggdzpathwaysgeo
  r-keggrest
  r-limma
)
optdepends=(
  r-doparallel
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7a3ecdd016cdd2f18e25bdae0fcc380c71deaea3ca777bc81762ddf8b6ffa866')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
