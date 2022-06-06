# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IlluminaHumanMethylationEPICanno.ilm10b4.hg19
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=0.6.0
pkgrel=3
pkgdesc="Annotation for Illumina's EPIC methylation arrays"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-minfi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c8128126b63e7fa805a5f3b02449367dca9c3be3eb5f6300acc718826590719')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
