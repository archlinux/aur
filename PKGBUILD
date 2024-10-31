# system requirements: libsbml (==5.10.2)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsbml
_pkgver=2.64.0
pkgname=r-${_pkgname,,}
pkgver=2.64.0
pkgrel=1
pkgdesc='R support for SBML, using libsbml'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-graph
  libsbml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('703c5e7dff3304556259eb34307c6f902c81a9decaad72b9960a6af0cf63f279')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
