# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAIT
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Statistical Analysis of Metabolomic Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-agricolae
  r-camera
  r-caret
  r-e1071
  r-gplots
  r-pls
  r-plsgenomics
  r-rcpp
  r-xcms
)
optdepends=(
  r-faahko
  r-rgl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a268aa74075939e2a33cef7de637be4646249a67a9c20009d72fde830052e767')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
