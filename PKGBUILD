# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBM
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='RBM: a R package for microarray and RNA-Seq data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9cca5652f1fcabc93209de31d62a25a3a1317df22e5790883139378b8d93f27b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
