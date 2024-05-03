# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pdInfoBuilder
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=1.68.0
pkgrel=1
pkgdesc='Platform Design Information Package Builder'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affxparser
  r-biobase
  r-biocgenerics
  r-biostrings
  r-dbi
  r-iranges
  r-oligo
  r-oligoclasses
  r-rsqlite
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('71b10e5a5800298c7a7dae51e94896d74761d3b0d541d78b2f9efbcd34058db5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
