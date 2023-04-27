# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneBreak
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Gene Break Detection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cghbase
  r-cghcall
  r-genomicranges
  r-qdnaseq
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04d803983d232f813730c3ac1a466ee14163ff6c5c91290a0b426578ca17310c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
