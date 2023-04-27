# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dyebias
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='The GASSCO method for correcting for slide-dependent gene-specific dye bias'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-marray
)
optdepends=(
  r-convert
  r-dyebiasexamples
  r-geoquery
  r-limma
  r-methods
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f321b1fb354f2242315d9b80f0d915c67b5f53fe52c439505a20c3f7a1989ad0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
