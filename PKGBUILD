# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BufferedMatrixMethods
_pkgver=1.61.0
pkgname=r-${_pkgname,,}
pkgver=1.61.0
pkgrel=1
pkgdesc='Microarray Data related methods that utlize BufferedMatrix objects'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bufferedmatrix
)
optdepends=(
  r-affy
  r-affyio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('805af95c5ded63389a7c515af435fea5e4694622de305f1d6b05053b3ae67af0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
