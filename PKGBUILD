# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TBX20BamSubset
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Subset of BAM files from the "TBX20" experiment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rsamtools
  r-xtable
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('432acf11789c4f73bb9d9ce64551a3c00cd88e69f0eab32b20276740fc90f780')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
