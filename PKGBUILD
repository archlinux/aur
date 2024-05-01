# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPXpressData
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=1.41.0
pkgrel=1
pkgdesc='ChIPXpress Pre-built Databases'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bigmemory
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3b5ae7f94e984010a4dbddb12916668d95c2fdf4ee53ac4f49fd4b82c117e9f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
