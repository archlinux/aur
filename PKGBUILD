# system requirements: optionally Graphviz (>= 2.16)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rgraphviz
_pkgver=2.46.0
pkgname=r-${_pkgname,,}
pkgver=2.46.0
pkgrel=1
pkgdesc='Provides plotting capabilities for R graph objects'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('EPL')
depends=(
  r
  r-graph
)
optdepends=(
  r-biocgenerics
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5e87fa40363e7ccc294946436b25cbdc3fa7b080e081e0777464db684ef6860e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
