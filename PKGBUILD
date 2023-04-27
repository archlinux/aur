# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CRImage
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='CRImage a package to classify cells and calculate tumour cellularity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-acgh
  r-dnacopy
  r-e1071
  r-ebimage
  r-foreach
  r-sgeostat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc69056e559667c89748ceb3e6025ce8592fe249ab10cabab454271a2b7a3386')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
