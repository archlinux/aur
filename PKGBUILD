# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneMeta
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
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
sha256sums=('c1f5a4bb27c0df02b7db1395a39a053994896fd203aa9f7d112e9016bb98e3f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
