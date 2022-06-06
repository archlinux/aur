# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IlluminaHumanMethylation450kmanifest
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=3
pkgdesc="Annotation for Illumina's 450k methylation arrays"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-minfi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41b2e54bac3feafc7646fe40bce3aa2b92c10871b0a13657c5736517792fa763')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
