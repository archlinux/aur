# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CRImage
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
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
sha256sums=('2c76f9b6442da822ce054f6fb86f032644974e7d420aa4512c5e1b6a163d747b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
