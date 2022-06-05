# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ACME
_pkgver=2.52.0
pkgname=r-${_pkgname,,}
pkgver=2.52.0
pkgrel=1
pkgdesc='Algorithms for Calculating Microarray Enrichment (ACME)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('454cde118e4336b7a5b5ccd6128a578dbc11bbe8df03d65d7c8754c2eed38c46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
