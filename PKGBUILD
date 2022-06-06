# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DriverNet
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Drivernet: uncovering somatic driver mutations modulating transcriptional networks in cancer'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cdde67ba605a406445255518def84bacad36e5a4f6acda7cdbdda2e40afec52')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
