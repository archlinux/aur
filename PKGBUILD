# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneMeta
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=1.78.0
pkgrel=1
pkgdesc='MetaAnalysis for High Throughput Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-genefilter
)
optdepends=(
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('29b471690d86f9e3f7f5de2e103019bb1615a2ee3360b4f243f904c79bc4d0c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
