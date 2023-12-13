# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rhdf5lib
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=1.24.1
pkgrel=1
pkgdesc='hdf5 library as an R package'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('90eb76a2f6b73e18c8fb560ab14e5e3a2c85ae747f278d66e67d3bebfe6c6551')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
