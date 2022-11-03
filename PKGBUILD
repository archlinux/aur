# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RnBeads.hg19
_pkgver=1.29.0
pkgname=r-${_pkgname,,}
pkgver=1.29.0
pkgrel=1
pkgdesc='RnBeads.hg19'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
)
optdepends=(
  r-rnbeads
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee9520adb8a56297e95e522f06c65e6ba9b82db0bd1680f79eebf063d184a26a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
