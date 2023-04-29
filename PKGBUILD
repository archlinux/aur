# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBGL
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
pkgrel=3
pkgdesc='An interface to the BOOST graph library'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bh
  r-graph
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rgraphviz
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dad8dd6fecf8dc8cc8f362773e48487451bce9b6388c788a867c70957984cf78')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
