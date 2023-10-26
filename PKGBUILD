# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TFARM
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Transcription Factors Association Rules Miner'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-arules
  r-fields
  r-genomicranges
  r-gplots
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-plyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('20c11ede7bd4689e7b4b90c7e399b3f17437690e6d91c01caa2cc294260b4efa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
